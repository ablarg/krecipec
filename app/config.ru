require './app.rb'
require 'sinatra/base'
require 'unicorn'
require 'rdiscount'

run App.new
