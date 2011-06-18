require 'spec_helper'

describe Yobot::Behaviors::PingPong do
  it "writes pong if it gets a ping" do
    room = stub(:room)
    
    room.should_receive(:text).with('pong')
    
    Yobot::Behaviors::PingPong.new.react(room, 'ping')
  end
  
  it "does nothing if message isn't ping" do
    room = stub(:room)
    
    room.should_not_receive(:text)
    
    Yobot::Behaviors::PingPong.new.react(room, 'peng')
  end
end
