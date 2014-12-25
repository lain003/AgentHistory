class DeployHistory < ActiveRecord::Base
  belongs_to :agent
  belongs_to :portal
end
