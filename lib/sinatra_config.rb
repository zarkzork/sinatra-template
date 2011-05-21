require 'warden_config'

module SinatraConfig

  def self.included(klass)
    klass.instance_eval do

      configure do
        enable :methodoverride
      end

      set :session, true
      set :haml, { :format => :html5 }
      
      helpers Sinatra::ContentFor
      helpers ::WardenHelper
      
    end
  end
  

end
