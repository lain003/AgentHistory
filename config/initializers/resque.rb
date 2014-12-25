require 'resque'
require 'resque/failure/multiple'
require 'resque/failure/redis'
require "email_notification"

Resque::Failure::Multiple.configure do |multi|
  multi.classes = [Resque::Failure::Redis, Resque::Failure::EmailNotification]
end
