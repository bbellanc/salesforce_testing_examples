class RestForceClient

  def self.create_connection
    Restforce.configure { |config| config.api_version = "28.0" }
    restforce_client = Restforce.new :username => 'branden.bellanca@gmail.com.dev',
                                     :password => 'Bellanca2468',
                                     :security_token => '8cC9a3NnPLhTF8BNJmM4PjIny',
                                     :client_id => '3MVG9KI2HHAq33RwG7rR_eq2UKqu0BLtoI7kGUAc5pDpRAF7mVmUrOw4WdcMzVjaUSpAqqzq0yfv4kVowu3kM',
                                     :client_secret => '8335121312097991471'
  end
end

