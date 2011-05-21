# encoding: utf-8
libdir = File.dirname(__FILE__)
$LOAD_PATH.unshift(libdir) unless $LOAD_PATH.include?(libdir)

require 'sinatra_config'

class App < Sinatra::Base
  include SinatraConfig

  before do
  end

  get '/' do
    flash.now[:info] = "I'm a flash!"
    haml :main
  end
  
  # warden authentication fail
  post '/unauthenticated/?' do
    halt 401, 'go away'
  end

end
