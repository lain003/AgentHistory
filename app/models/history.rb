class History
  def self.select(page)
    histories = []
    histories += DeployHistory.includes(:agent,:portal).order(:action_time)
    histories += LinkHistory.includes(:agent,:from_portal,:to_portal).order(:action_time)
    histories += CaptureHistory.includes(:agent,:portal).order(:action_time)
    histories += DestroyeHistory.includes(:agent,:portal).order(:action_time)
    histories.sort_by! do |history|
      history.action_time
    end.reverse!

    return KaminariHistory.new(histories[(limit_count(page)-Kaminari.config.default_per_page)..limit_count(page)],page,histories.count)
  end

  def self.where_portal(portal_id,page)
    histories = []
    histories += DeployHistory.includes(:agent,:portal).where(:portal_id => portal_id).order(:action_time)
    histories += LinkHistory.includes(:agent,:from_portal,:to_portal).where("from_portal_id = ? OR to_portal_id = ?",portal_id,portal_id).order(:action_time)
    histories += CaptureHistory.includes(:agent,:portal).where(:portal_id => portal_id).order(:action_time)
    histories += DestroyeHistory.includes(:agent,:portal).where(:portal_id => portal_id).order(:action_time)
    histories.sort_by! do |history|
      history.action_time
    end.reverse!

    return KaminariHistory.new(histories[(limit_count(page)-Kaminari.config.default_per_page)..limit_count(page)],page,histories.count)
  end

  def self.where_agent(agent_id,page)
    histories = []
    histories += DeployHistory.includes(:agent,:portal).where(:agent_id => agent_id).order(:action_time)
    histories += LinkHistory.includes(:agent,:from_portal,:to_portal).where(:agent_id => agent_id).order(:action_time)
    histories += CaptureHistory.includes(:agent,:portal).where(:agent_id => agent_id).order(:action_time)
    histories += DestroyeHistory.includes(:agent,:portal).where(:agent_id => agent_id).order(:action_time)
    histories.sort_by! do |history|
      history.action_time
    end.reverse!

    return KaminariHistory.new(histories[(limit_count(page)-Kaminari.config.default_per_page)..limit_count(page)],page,histories.count)
  end

  def self.limit_count(page)
    page = 1 if page <= 0
    Kaminari.config.default_per_page * page
  end
end
