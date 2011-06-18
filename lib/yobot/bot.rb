class Yobot::Bot
  def initialize(behaviors)
    @behaviors = behaviors
  end
  
  def received_message(room, message)
    if message =~ /^yobot/
      @behaviors.each do |behavior|
        behavior.react room, message.sub(/^yobot /, '')
      end
    end
  end
end
