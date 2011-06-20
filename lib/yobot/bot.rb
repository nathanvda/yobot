class Yobot::Bot
  def initialize(behaviors)
    @behaviors = behaviors
  end
  
  def received_message(room, message)
    if message =~ /^yo/
      @behaviors.each do |behavior|
        behavior.react room, message.sub(/^yo /, '')
      end
    end
  end
end
