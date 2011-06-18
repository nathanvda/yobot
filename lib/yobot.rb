module Yobot
  module Behaviors
  end
end

$LOAD_PATH.unshift File.dirname(__FILE__)

require 'firering'
require 'JSON'
require 'yobot/bot'
require 'yobot/behaviors/ping_pong'
require 'yobot/behaviors/dict'

if __FILE__ == $0
  login = api_key = 'yobot'
  password = 'NlQC5XMsm@5qgzufc'
  subdomain = 'upstream'

  conn = Firering::Connection.new("http://#{subdomain}.campfirenow.com") do |c|
    c.login = login
    c.password = password
    c.max_retries = 10 # default to -1, which means perform connection retries on drop forever.
  end
  
  bot = Yobot::Bot.new [Yobot::Behaviors::PingPong.new, Yobot::Behaviors::Dict.new]

  EM.run do
    conn.authenticate do |user|
      conn.rooms do |rooms|
        rooms.each do |room|
          room.text('Hello World') {}
          room.stream do |message|
            if message.type == 'TextMessage'
              bot.received_message room, message.body
            end
          end
        end
      end
    end

    trap("INT") { EM.stop }
  end
end