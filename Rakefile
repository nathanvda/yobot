require 'rake'
begin
  require 'rspec/core/rake_task'

  RSpec::Core::RakeTask.new(:spec)
rescue LoadError
  STDERR.puts 'RSpec not installed. This is probably ok.'
end

task :default => :spec

task :run do
  require File.dirname(__FILE__) + '/lib/yobot'
  
  login = api_key = 'yobot'
  password = 'NlQC5XMsm@5qgzufc'
  subdomain = 'upstream'

  conn = Firering::Connection.new("http://#{subdomain}.campfirenow.com") do |c|
    c.login = login
    c.password = password
    c.max_retries = 10 # default to -1, which means perform connection retries on drop forever.
  end

  bot = Yobot::Bot.new [Yobot::Behaviors::PingPong.new, Yobot::Behaviors::Dict.new, Yobot::Behaviors::Anaveda.new]
  
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