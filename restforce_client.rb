class RestForceClient

  def self.create_connection
    #Configure Restforce with your connected app
    Restforce.configure do |config|
      config.api_version = "28.0"
      config.client_id = connected_app[:app][:client_id]
      config.client_secret = connected_app[:app][:client_secret]
    end

    #Establish a connection
    Restforce.new username: connected_app[:credentials][:username],
                  password: connected_app[:credentials][:password],
                  security_token: connected_app[:credentials][:security_token]
  end
end


