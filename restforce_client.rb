class RestForceClient

  def self.create_connection
    Restforce.configure { |config| config.api_version = "28.0" }
    restforce_client = Restforce.new username: 'branden.bellanca@gmail.com.dev',
                                     password: 'Winter15',
                                     client_id: '3MVG9KI2HHAq33RwG7rR_eq2UKqu0BLtoI7kGUAc5pDpRAF7mVmUrOw4WdcMzVjaUSpAqqzq0yfv4kVowu3kM',
                                     client_secret: '8335121312097991471',
                                     security_token: 'gje3S5L1NemTEZQLJlyH4XNRS'
  end
end

