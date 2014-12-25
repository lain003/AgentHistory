require 'resque/failure/base'
require 'mail'

module Resque
  module Failure
    class EmailNotification < Base
      def save
        subject = "[FATAL] Resque #{queue}:#{worker}"
        body = "#{exception.class} #{exception.to_s}\n#{exception.backtrace.join("\n")}"
        Mail.defaults do
          delivery_method :sendmail
        end
        Mail.deliver do
          from ENV["ERRORNOTIFI_ADRESS"]
          to   ENV["ERRORNOTIFI_ADRESS"]
          subject subject
          body body
        end
      rescue => e
        puts "#{e.class} #{e.to_s}"
        puts e.backtrace.join("\n")
      end
    end
  end
end
