class ParseDestroyeHistory
  extend Resque::Plugins::History
  @queue = :parse_destroyeHistory

  def self.perform(para_hash)
    return if DestroyeHistory.where(:ident_code => para_hash["ident_code"]).count != 0

    markup = para_hash["markup"]
    portal = Portal.factory_intelParameter(markup[4][1])


    DestroyeHistory.create(
    :ident_code => para_hash["ident_code"],
    :action_time => Time.parse(para_hash["time"]),
    :agent_id => para_hash["agent_id"],
    :portal_id => portal.id,
    :resonator_level => markup[2][1]["plain"][1]
    )

  end
end
