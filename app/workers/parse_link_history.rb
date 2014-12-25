class ParseLinkHistory
  extend Resque::Plugins::History
  @queue = :parse_linkHistory

  def self.perform(para_hash)
    return if LinkHistory.where(:ident_code => para_hash["ident_code"]).count != 0

    markup = para_hash["markup"]
    toPortal = Portal.factory_intelParameter(markup[2][1])
    fromPortal = Portal.factory_intelParameter(markup[4][1])

    LinkHistory.create(
    :ident_code => para_hash["ident_code"],
    :action_time => Time.parse(para_hash["time"]),
    :agent_id => para_hash["agent_id"],
    :to_portal_id => toPortal.id,
    :from_portal_id => fromPortal.id
    )

  end
end
