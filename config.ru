require "bundler/setup"

Bundler.require(:sinatra)

require './lib/app'
require 'error_page'

use Rack::StaticCache, :urls => ["/stylesheets", "/images", "/js", "/favicon.ico"],
                       :root => "public", :versioning => false

use ErrorPage do
  haml :error
end

use Rack::Session::Cookie
use Rack::Flash

use Warden::Manager do |manager|
  manager.default_strategies :password
  manager.failure_app = App
end

App.configure do |app|
   app.set :root, Dir.pwd
end

# run compass watch in background
App.configure :development do
  pid = fork {
    Signal.trap('INT'){ exit! }
    exec('compass watch')
  }
  at_exit {
    Process.kill 'INT', pid
  }
end

run App.new
