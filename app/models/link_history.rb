class LinkHistory < ActiveRecord::Base
  belongs_to :from_portal,:class_name => "Portal",:foreign_key => "from_portal_id"
  belongs_to :to_portal,:class_name => "Portal", :foreign_key => "to_portal_id"
  belongs_to :agent
end
