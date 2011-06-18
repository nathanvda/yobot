require 'spec_helper'

describe Yobot::Behaviors::Dict do
  it "looks up the word" do
    request = stub(:request)
   
    EventMachine::HttpRequest.should_receive(:new).with(
  'https://ajax.googleapis.com/ajax/services/language/translate') {request}
    request.should_receive(:get).with(query: {v: '1.0', q: 'car', langpair: '|en'}) {stub.as_null_object}
    
    Yobot::Behaviors::Dict.new.react(stub, 'translate car')
  end
  
  it "translates the the word into the given language" do
    request = stub(:request)
   
    EventMachine::HttpRequest.should_receive(:new).with(
  'https://ajax.googleapis.com/ajax/services/language/translate') {request}
    request.should_receive(:get).with(query: {v: '1.0', q: 'car', langpair: '|de'}) {stub.as_null_object}
    
    Yobot::Behaviors::Dict.new.react(stub, 'translate car to de')
  end
  
  
  it "prints the translations to the room" do
    room = stub
    request = stub(:request)
    http = stub(:http)
    EventMachine::HttpRequest.stub(:new) {request}
    request.stub(:get) {http}
    http.stub(:callback).and_yield
    http.stub(:response) {
      {"responseData" => {"translatedText" => "auto"}}.to_json
    }
    
    room.should_receive(:text).with('car in en: auto')

    Yobot::Behaviors::Dict.new.react(room, 'translate car')
  end
  
  it "does nothing if the message doesn't start with dict" do
    EventMachine::HttpRequest.should_not_receive(:new)

    Yobot::Behaviors::Dict.new.react(stub, 'bingo')
  end
end
