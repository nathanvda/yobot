# encoding: utf-8
require 'spec_helper'

describe Yobot::Behaviors::Anaveda do
  it "gets the anaveda food page" do
    request = stub(:request)

    EventMachine::HttpRequest.should_receive(:new).with('http://www.anaveda.de/neu/mittagstisch/') {request}
    request.should_receive(:get) {stub.as_null_object}
    
    Yobot::Behaviors::Anaveda.new.react(stub, 'anaveda')
  end
  
  it "writes out today's menu" do
    room = stub
    request = stub(:request)
    http = stub(:http)
    EventMachine::HttpRequest.stub(:new) {request}
    request.stub(:get) {http}
    http.stub(:callback).and_yield
    http.stub(:response) {food_html}
    
    room.should_receive(:paste).with(%Q{Fruchtig frischer Eintopf aus bio rote Bete\n und Spinat, dazu frisches Baguette und Schmand 5,70\n\nOrientalischer Hähncheneintopf\n mit Kichererbsen, Auberginen und Tahin dazu Langkornreis 6,20\n\nPaniertes Rotbarschfilet an Kartoffelsalat und Gurkensalat 7,40\n\nGebratene Lammhaxe\n mit einem Sud aus Rosmarin, Tomaten und\n Rotwein, dazu griechischer Bauernsalat mit Fetakäse 7,40\n\nSpaghetti mit neuem Olivenöl und Parmesan, dazu 5,50\n\nSalatangebot:\n Anaveda-Salatteller mit zwei unterschiedlichen Pasten dazu 5,90\n\nDauerkarte:Penne mit Möhre-Ingwer-Paste oder Tomate-Thymian 5,00\n Penne mit Pesto Rosso oder Pesto Ruccola, dazu Parmesan 5,50})

    Yobot::Behaviors::Anaveda.new.react(room, 'anaveda')
  end
  
  it "does nothing if the message doesn't start with anaveda" do
    request = stub(:request)

    EventMachine::HttpRequest.should_not_receive(:new)
    
    Yobot::Behaviors::Anaveda.new.react(stub, 'test')
  end
  
  def food_html
    <<-HTML
      
      <!doctype html> 
      <html xmlns="http://www.w3.org/1999/xhtml" dir="ltr" lang="de-DE"> 
      <head> 
      <title>Mittagstisch &laquo;  (Anaveda)</title> 
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" /> 
      <link rel="stylesheet" type="text/css" href="/css/reset-min.css" /> 
      <link rel="stylesheet" type="text/css" href="/css/design.css?2010-08-31" /> 
      <!--[if lt IE 7.0]><link rel="stylesheet" type="text/css" media="screen" href="/css/ielt7.css" /><![endif]--> 
      <script type="text/javascript" src="/js/html5.js"></script> 
      <script type="text/javascript" src="/js/contentheight.js"></script> 
      </head> 
      <body> 
      <div id="Wrapper"> 
      <header> 
      <div id="Logo"><a href="/"><img src="/images/anaveda.png" alt="Anaveda" /></a></div> 

      <section id="Navi"> 
      <nav> 
      <ul> 
      <li class="Active"><a href="/neu/mittagstisch">Mittagstisch</a></li> 
      <li><a href="/neu/restaurant">Restaurant</a></li> 
      <li><a href="/neu/catering">Catering</a>li> 
      <li><a href="/neu/feinkost">Feinkost</a></li> 
      <li><a href="/neu/kurse">Kurse</a></li> 
      <li><a href="/neu/ueber-uns">&Uuml;ber uns</a></li> 
      </ul> 
      </nav> 
      </section> 
      </header> 

      <section id="Content"> 
      <article> 

      						<h1>Mittagstisch</h1> 
      							<p><strong>Freitag, den 17. Juni 2011</strong></p> 
      <h3 style="text-align: left;">von 12.00 Uhr bis 15.30 Uhr</h3> 
      <p><em> </em></p> 
      <h3>ayurvedischer Kochtopf</h3> 
      <p><em> </em></p> 
      <p><em> </em></p> 
      <p><em> </em></p> 
      <p>Fruchtig frischer Eintopf aus bio rote Bete<br /> 
      und Spinat, dazu frisches Baguette und Schmand<em> </em>5,70<em><br /> 
      Fruity stew with beetroot and spinach,<br /> 
      fresh baguette</em></p> 
      <p>Orientalischer Hähncheneintopf<br /> 
      mit Kichererbsen, Auberginen und Tahin dazu Langkornreis<em> </em>6,20<em><br /> 
      Oriental chicken stew with chick peas, eggplants<br /> 
      and sesame cream, long grain rice</em></p> 
      <p><em> </em></p> 
      <h3>Muttis Kochtopf</h3> 
      <p>Paniertes Rotbarschfilet an Kartoffelsalat und Gurkensalat    7,40<em><br /> 
      Breaded redfish fillet wiht potato salad<br /> 
      and cucumber salad</em></p> 
      <p>Gebratene Lammhaxe<br /> 
      mit einem Sud aus Rosmarin, Tomaten und<br /> 
      Rotwein, dazu griechischer Bauernsalat mit Fetakäse   7,40<em><br /> 
      Fried lamb hock in a rosmary, tomato and red wine<br /> 
      brew, greek farmer salad with feta </em></p> 
      <p><em> </em></p> 
      <p>Spaghetti mit neuem Olivenöl und Parmesan, dazu    5,50<br /> 
      Kapern, Sardellen, Cherrytomaten.<br /> 
      Bitte wählen Sie, was Sie haben möchten<em><br /> 
      Spaghetti with new olive oil and parmesan, with<br /> 
      capers, anchovies, cherrytomatoes. </em></p> 
      <p><em>Please choose. </em></p> 
      <p><span style="text-decoration: underline;"><strong>Salatangebot</strong>:</span><br /> 
      Anaveda-Salatteller mit zwei unterschiedlichen Pasten dazu   5,90</p> 
      <p><strong><span style="text-decoration: underline;">Dauerkarte:</span><br /> 
      </strong>Penne mit  Möhre-Ingwer-Paste oder Tomate-Thymian   5,00<br /> 
      Penne mit Pesto Rosso oder Pesto Ruccola, dazu Parmesan   5,50</p> 
      <p style="text-align: left;"> 
      <p style="text-align: left;"> 
      <p style="text-align: left;"> 
      <p style="text-align: left;"> 
      <p style="text-align: left;"><em> </em></p> 





      </article> 

      <aside> 
      <div class="Illu"><img src="/images/illu_mittagtisch.jpg" alt="" /></div> 
      <h3>anaveda</h3> 
      <p>ayurvedische feinkostmanufaktur<br /> 
      oranienstr. 169<br /> 
      10999 berlin-kreuzberg</p> 

      <p>Tel. 030 | 53 00 70 61</p> 
      </aside> 

      <div class="Clear"></div> 

      </section> 

      <div id="Metanavi"> 
      <nav> 
      <a href="/">Home</a> | <a href="/neu/impressum/">Impressum</a> | <a href="/neu/kontakt/">Kontakt</a> 
      </nav> 
      </div><!-- #Metanavi --> 

      <footer> 
      <p>&copy; Anaveda. Inhaberin: Anita Printz. </p> 
      </footer> 
      </div><!-- #Wrapper --> 
      </body> 
      </html>
    HTML
  end
end
