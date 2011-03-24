# encoding: utf-8
libdir = File.dirname(__FILE__)
$LOAD_PATH.unshift(libdir) unless $LOAD_PATH.include?(libdir)

require 'rack'
require 'sinatra/base'


class App < Sinatra::Base

  configure do
    enable :methodoverride
  end

  set :session, true
  use Rack::Session::Cookie

  before do
  end

  # app routes here

end
