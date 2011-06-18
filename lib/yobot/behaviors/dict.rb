class Yobot::Behaviors::Dict
  def react(room, message)
    if message =~ /^translate/
      request = EventMachine::HttpRequest.new('https://ajax.googleapis.com/ajax/services/language/translate')
      language = (message.scan(/to (\w{2})$/).first || ['en']).first
      word = message.sub(/^translate /, '').sub(/ to \w{2}$/, '')
      http = request.get(query: {v: '1.0', q: word, langpair: "|#{language}"})
      http.callback do
        room.text("#{word} in #{language}: #{JSON.parse(http.response)['responseData']['translatedText']}") {}
      end
    end
  end
end