class Constants < Settingslogic
  source "#{Rails.root}/config/constants.yml"
  namespace Rails.env
end
