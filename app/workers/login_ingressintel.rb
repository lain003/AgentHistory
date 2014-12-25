class LoginIngressintel
  extend Resque::Plugins::History
  @queue = :login_ingressintel

  def self.perform(lange_hash)
    url_s = "https://accounts.google.com/ServiceLogin?service=ah&passive=true&continue=https%3A%2F%2Fappengine.google.com%2F_ah%2Fconflogin%3Fcontinue%3Dhttps%3A%2F%2Fwww.ingress.com%2Fintel&ltmpl"
    agent = Mechanize.new
    singin_page = agent.get(url_s)
    singin_form = singin_page.form
    singin_form.Email = ENV["GMAIL_ADRESS"]
    singin_form.Passwd = ENV["GMAIL_PASSWORD"]
    ingressIntel_page = agent.submit(singin_form)

    csrf_cookie = agent.cookies.find do |a|
      a.name == "csrftoken"
    end
    sacsid_cookie = agent.cookies.find do |a|
      a.name == "SACSID"
    end
    
    para_hash = {"csrf" => csrf_cookie.value,"sacsid" => sacsid_cookie.value,"from_time" => lange_hash["from_time"],"to_time" => lange_hash["to_time"],"v_para" => getParameter_v(agent)}
    Resque.enqueue(CrawlHistory, para_hash)
  end

  def self.getParameter_v(agent)
    js_s = agent.get("https://www.ingress.com/jsc/gen_dashboard.js").body
    v = js_s.scan(/v=".*";/).first.scan(/".*"/).first.scan(/[^"$]/).join
    return v
  end
end
