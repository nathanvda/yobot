class Yobot::Behaviors::PingPong
  def react(room, message)
    room.text 'pong' if message == 'ping'
  end
end