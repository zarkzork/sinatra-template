require "bundler/setup"

require './lib/app'
require 'rack/contrib/static_cache'
require 'error_page'

use Rack::StaticCache, :urls => ["/css", "/images", "/js", "/favicon.ico"],
                       :root => "public", :versioning => false
use ErrorPage do
   haml :error
end
                       
App.configure do |app|
   app.set :root, Dir.pwd
end

run App.new
