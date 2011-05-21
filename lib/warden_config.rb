# provide warden with way to retrieve/store user in session.
Warden::Manager.serialize_into_session{|user| raise NotImlementedError }
Warden::Manager.serialize_from_session{|id| raise NotImlementedError }
 
Warden::Manager.before_failure do |env,opts|
  env['REQUEST_METHOD'] = "POST"
end

# sample warden strategy
Warden::Strategies.add(:password) do
  def valid?
    params["email"] || params["password"]
  end
 
  def authenticate!
    raise NotImlementedError
    u = User.authenticate(params["email"], params["password"])
    u.nil? ? fail!("Could not log in") : success!(u)
  end
end

module WardenHelper
  def warden
    env['warden']
  end
end
