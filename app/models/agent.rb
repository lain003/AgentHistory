class Agent < ActiveRecord::Base
  belongs_to :team

  def self.factory(_name,teamName)
    agent = Agent.where(:name => _name)
    return agent.first if agent.count != 0

    team = Team.where(:name => teamName)
    raise teamName + " はTeamtテーブルに存在しません" if team.count == 0

    Agent.create(:name => _name,:team_id => team.first.id)
  end
end
