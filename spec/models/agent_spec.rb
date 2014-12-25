require 'rails_helper'

RSpec.describe Agent, :type => :model do
  describe "self.factory" do
    it "既にいるエージェント名を指定した場合は、そのエージェントが帰ってくる事" do
      exist_agent = Agent.create(:name => "a",:team_id => Team.first.id)
      agent = Agent.factory(exist_agent.name,Team.first.name)
      agent.id.should == exist_agent.id
    end

    it "存在しないチーム名を指定した場合は、例外を発生させること" do
      expect { Agent.factory("aaa","hoga") }.to raise_error
    end

    it "それ以外の場合はエージェントが作られる事" do
      old_count = Agent.count
      Agent.factory("fue",Team.first.name)
      Agent.count.should == (old_count+1)
    end
  end
end
