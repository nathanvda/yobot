class Yobot::Bot
  def initialize(room, behaviors)
    @room = room
    @behaviors = behaviors
  end
  
  def received_message(message)
    if message =~ /^yobot/
      @behaviors.each do |behavior|
        behavior.message @room, message.sub(/^yobot /, '')
      end
    end
  end
end