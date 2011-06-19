require 'nokogiri'

class Yobot::Behaviors::Anaveda
  def react(room, message)
    if message =~ /^anaveda/
      http = EventMachine::HttpRequest.new('http://www.anaveda.de/neu/mittagstisch/').get
      http.callback do
        room.text(extract_menu(http.response)) {}
      end
    end
  end
  
  private
  
  def extract_menu(html)
    doc = Nokogiri::HTML(html)
    doc.css('article').inner_text.gsub("\t", '').gsub(/ +/, ' ').gsub(/\s+$/, '').gsub(/\n+/, "\n")
  end
end