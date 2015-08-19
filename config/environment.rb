require 'bundler/setup'
Bundler.require(:default, :development)
$: << '.'

Dir["../app/concerns/module.rb"].each {|f| require f}
Dir["../app/models/model.rb"].each {|f| require f}
Dir["../app/data_fetchers/job_listing_caller.rb"].each {|f| require f}
Dir["../app/runners/job_listing_runner.rb"].each {|f| require f}

Dir["../app/runners/testing.rb"].each {|f| require f}

require "open-uri"
require "json"
require "pry"
