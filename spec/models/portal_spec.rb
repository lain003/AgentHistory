require 'rails_helper'

RSpec.describe Portal, :type => :model do
  it 'latE6,lngE6 が複合でユニークな事' do
    portal = Portal.create(:latE6 => 111111,:lngE6 => 222222,:address => "a",:name => "name")
    expect { Portal.create(:latE6 => portal.latE6,:lngE6 => portal.lngE6) }.to raise_error

    Portal.create(:latE6 => portal.latE6+1,:lngE6 => portal.lngE6)
  end

  describe "self.factory" do
    it "既に同じlatE6,lngE6のデータが入ってきた場合、既存の物を返す事" do
      exist_portal = Portal.create(:latE6 => 111111,:lngE6 => 222222,:address => "a",:name => "name")
      portal = Portal.factory(111111,222222,"a","name")

      portal.id.should == exist_portal.id
    end

    it "かぶらないlatE6,lngE6のデータが入ってきた場合、新しいportalを作成する事" do
      exist_portal = Portal.create(:latE6 => 111111,:lngE6 => 222222,:address => "a",:name => "name")
      old_count = Portal.count
      Portal.factory(222222,222222,"a","name")
      Portal.count.should == old_count+1
    end
  end
end
