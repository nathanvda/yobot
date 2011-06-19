module Yobot
  module Behaviors
  end
end

$LOAD_PATH.unshift File.dirname(__FILE__)

require "rubygems"
require "bundler/setup"

require 'firering'
require 'json'
require 'yobot/bot'
require 'yobot/behaviors/ping_pong'
require 'yobot/behaviors/dict'
require 'yobot/behaviors/anaveda'