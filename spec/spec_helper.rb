require('sinatra/activerecord')

require('rspec')
require('pry')
require('./lib/survey')
require('./lib/question')
require('./lib/response')
require('pg')

ENV['RACK_ENV'] = 'test'

RSpec.configure do |config|
  config.after(:each) do
    Survey.all().each() do |s|
      s.destroy()
    end
  end
end
