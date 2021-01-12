require 'dotenv/load'
require 'nokogiri'
require 'open-uri'
require 'json'
require 'net/http'

require 'pry'

require_relative "./heroes/version"
require_relative "./heroes/cli"
require_relative "./heroes/get_req"
require_relative "./heroes/search"
require_relative "./heroes/character"

# acts as environment file
