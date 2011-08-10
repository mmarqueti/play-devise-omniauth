# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Devisefull::Application.initialize!

ENV['FB_KEY'] = 'KEY'
ENV['FB_SECRET'] = 'SECRET'

ENV['TW_KEY'] = 'KEY'
ENV['TW_SECRET'] = 'SECRET'

