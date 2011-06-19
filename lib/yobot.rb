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