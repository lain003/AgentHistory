module HistoryHelper
  def show_history(history)
    agent_color = "green" if history.agent.team.name == Constants.team.enlightened
    agent_color = "blue" if history.agent.team.name == Constants.team.resistance

    message = history.action_time.strftime('%m/%d %H:%M:%S') + " " + link_to(history.agent.name,history.agent,{:class => agent_color}) + "が　"
    if history.class == DestroyeHistory
      message += link_portal(history.portal) + "で　レベル" + history.resonator_level.to_s + "の　リゾネータを壊した"
    elsif history.class == LinkHistory
      message += link_portal(history.from_portal) + "から　" + link_portal(history.to_portal) + "に　リンクをはった"
    elsif history.class == DeployHistory
      message += link_portal(history.portal) + "で　レベル" + history.resonator_level.to_s + "の　リゾネータを設置した"
    elsif history.class == CaptureHistory
      message += link_portal(history.portal) + "を　キャプチャーした"
    end

    content_tag(:div,message.html_safe,{:class => "history"})
  end

  def link_portal(portal)
    link_to(portal.name,portal)
  end
end
