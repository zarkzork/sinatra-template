require "bundler/setup"

require './lib/app'
require 'rack/contrib/static_cache'

use Rack::StaticCache, :urls => ["/css", "/images", "/js", "/favicon.ico"],
                       :root => "public", :versioning => false
                       
App.configure do |app|
   app.set :root, Dir.pwd
end

run App.new
