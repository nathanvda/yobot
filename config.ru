class WebApp
  def call(env)
    return [
      200,
      {'Content-Type' => 'text/plain'},
      ['yobot!']
    ]
  end
end

run WebApp.new