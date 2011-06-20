### Yobot

Yobot is an extensible campfire bot. You can ask and tell it all kinds of things.

### Installation

set ENV['CAMPFIRE\_LOGIN'], ENV['CAMPFIRE\_PASSWORD'] and ENV['CAMPFIRE\_SUBDOMAIN] to a valid campfire account/site.

To start just run `rake run`

### Behaviors

Behaviors live in lib/yobot/behaviors. A behavior consists of at least one class that implements the following interface:

  class MyBehavior

    # reacts to a message in a chatroom (or not)
    # room - a Firering::Room
    # message - a text message written in the room (String)
    def react(room, message)

    end
    
    # returns a short description string that explains how to use this behavior
    def description
    end
  end
  
Behaviors should read all the configuration they need (e.g. API credentials) from ENV.
    
### Built-In behaviors

#### Working

* `ping` - `pong`
* `dict <word>` - prints out the translation from google translate
* `anaveda` - prints out today's lunch menu from anaveda.de
  
#### Planned

* `bvg <from> to <to>` - prints out the next train from A to B via bvg.de (Berlin)
* `weather <city>` - prints the weather forecast
* `remind me 20:00 <title>` - will print out a reminder at the given time
* `help` - returns a list of commands
* `tweet <message>` - sends a message to twitter
* `today` - prints out today's events from a calendar
* `shop <item>` - adds an item to the shopping list
* `shopping list` - prints out the shopping list
* `clear shopping list` - clears the shopping list
* `shopped <item>` - removes all items that start with the string from the shopping list
* `news` - prints out the latest news from a list of RSS feeds, does not print the same item twice
* `movies` - prints out which movies are on tonight at cinestar potsdamer platz berlin