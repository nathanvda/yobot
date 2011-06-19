require 'nokogiri'

class Yobot::Behaviors::Anaveda
  def react(room, message)
    if message =~ /^anaveda/
      http = EventMachine::HttpRequest.new('http://www.anaveda.de/neu/mittagstisch/').get
      http.callback do
        room.paste(extract_menu(http.response)) {}
      end
    end
  end
  
  private
  
  def extract_menu(html)
    doc = Nokogiri::HTML(html)
    items = []
    doc.css('article p').each do |paragraph|
      text = paragraph.inner_text
      if text =~ /\d,\d\d/m
        items << text.scan(/.+\d,\d\d/m).first.gsub(/ +/, ' ').gsub(/\s+$/, '')
      end
    end
    items.join("\n\n")
  end
end