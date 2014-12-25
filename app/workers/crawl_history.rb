class CrawlHistory
  extend Resque::Plugins::History
  @queue = :crawl_history

  def self.perform(para_hash)
    res = get_getPlexts(para_hash)
    dashboard_json = JSON.parse(res.body)

    dashboard_json["success"].each do |message|
      identCode = message[0]
      time = parse_timeResponse(message[1])
      markup = message[2]["plext"]["markup"]

      agent_hash = markup.first[1]
      agent = Agent.factory(agent_hash["plain"],agent_hash["team"])

      verd = markup[1][1]["plain"]

      param_hash = {"ident_code" => identCode,"time" => time.to_s,"agent_id" => agent.id,"markup" => markup}
      if verd == " deployed an "
        Resque.enqueue(ParseDeployHistory, param_hash)
      elsif verd == " linked "
        Resque.enqueue(ParseLinkHistory, param_hash)
      elsif verd == " created a Control Field @"
      elsif verd == " captured "
        Resque.enqueue(ParseCaptureHistory, param_hash)
      elsif verd == " destroyed an "
        Resque.enqueue(ParseDestroyeHistory, param_hash)
      else
      end
    end

    last_time = parse_timeResponse(dashboard_json["success"].last[1])
    from_time = Time.parse(para_hash["from_time"])

    if from_time <= last_time
      para_hash = {"csrf" => para_hash["csrf"],"sacsid" => para_hash["sacsid"],"from_time" => from_time.to_s,"to_time" => last_time.to_s,"v_para" => para_hash["v_para"]}
      Resque.enqueue(CrawlHistory, para_hash)
    end
  end

  def self.get_getPlexts(para_hash)
    uri = URI("https://www.ingress.com/r/getPlexts")
    https = Net::HTTP.new(uri.host,uri.port)
    https.use_ssl = true

    req = Net::HTTP::Post.new(uri.path, headers(para_hash["csrf"],para_hash["sacsid"]))
    time_param = create_timeResponse(Time.parse(para_hash["to_time"]))
    req.body = plexts_params(para_hash["v_para"],time_param)

    log = Logger.new 'log/resque.log'
    log.debug req.body

    return https.request(req)
  end

  def self.plexts_params(v,timestamp=-1)
    toSend = {
      "minLatE6" => ENV["MINLATE6"].to_i,
      "minLngE6" => ENV["MINLNGE6"].to_i,
      "maxLatE6" => ENV["MAXLATE6"].to_i,
      "maxLngE6" => ENV["MAXLNGE6"].to_i,
      "tab" => "all",
      "v" => v,
      "maxTimestampMs" => timestamp,##ここに指定された時間以前のデータ、最新50件をもってくる。
      "minTimestampMs" => -1
    }.to_json
  end

  def self.headers(csrf,sacsid)
    cookie = {
      'csrftoken' => csrf,
      'SACSID' => sacsid
    }
    initheaders = {
      'x-csrftoken' => csrf,
      'referer' => 'https://www.ingress.com/intel',
      'cookie' => cookie.map{|k,v|
        "#{k}=#{v}"
      }.join('; ')
    }
  end

  def self.parse_timeResponse(para_time)
    s = para_time.to_s
    s = s[0, s.length - 3]
    return Time.at(s.to_i)
  end

  def self.create_timeResponse(time)
    s = time.to_i
    s = s*1000#謎の３桁分を0で埋める
    return s
  end
end
