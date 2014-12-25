class ParseCaptureHistory
  extend Resque::Plugins::History
  @queue = :parse_captureHistory

  def self.perform(para_hash)
    return if CaptureHistory.where(:ident_code => para_hash["ident_code"]).count != 0

    markup = para_hash["markup"]
    portal = Portal.factory_intelParameter(markup[2][1])

    CaptureHistory.create(
    :ident_code => para_hash["ident_code"],
    :action_time => Time.parse(para_hash["time"]),
    :agent_id => para_hash["agent_id"],
    :portal_id => portal.id
    )

  end
end
