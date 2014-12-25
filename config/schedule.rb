require 'dotenv'
Dotenv.load

sicle_sec = ENV["CROWLER_CYCLE_HOUR"].to_i*3600

set :output, 'log/crontab.log'

set :environment,ENV["RAILS_ENV"]\

every sicle_sec,:at => '0:05' do
  runner "./bin/regist_crowler"
end
