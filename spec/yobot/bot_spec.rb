require 'spec_helper'

describe Yobot::Bot, 'on_message' do
  it "passes the message to all behaviors if it starts with yobot" do
    behavior = stub(:behavior)
    room = stub(:room)
    
    behavior.should_receive(:message).with(room, 'ping')
    
    Yobot::Bot.new(room, [behavior]).received_message('yobot ping')
  end
  
  it "does nothing if the messae doesn't start with yobot" do
    behavior = stub(:behavior)
    
    behavior.should_not_receive(:message)
    
    Yobot::Bot.new(stub, [behavior]).received_message('hello')
  end
end
