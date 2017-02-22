require 'awesome_print'
require 'dotenv'
require 'strava/api/v3'
require './lib/stat.rb'

Dotenv.load('environment.env')


client = Strava::Api::V3::Client.new(access_token: ENV['ACCESS_TOKEN'])

stat = Stat.new(client)
ap stat.distance_in_current_week