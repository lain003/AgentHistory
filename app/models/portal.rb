class Portal < ActiveRecord::Base
  def self.factory(latE6,lngE6,address,name)
    exist_portal = Portal.where(:latE6 => latE6,:lngE6 => lngE6)
    return exist_portal[0] if exist_portal.count != 0

    return Portal.create(:latE6 => latE6,:lngE6 => lngE6,:address => address,:name => name)
  end

  def self.factory_intelParameter(hash)
    Portal.factory(hash["latE6"],hash["lngE6"],hash["address"],hash["name"])
  end
end
