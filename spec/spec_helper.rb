$LOAD_PATH.unshift(File.join(__dir__, '..'))
require 'rspec'
require 'active_force'
require 'models/job_application'
require 'models/position'
require 'models/candidate'
require 'models/user'

Restforce.configure { |config| config.api_version = "35.0" }
restforce_client = Restforce.new :username => 'branden.bellanca@gmail.com.dev',
                                 :password => 'Bellanca2468',
                                 :security_token => '8cC9a3NnPLhTF8BNJmM4PjIny',
                                 :client_id => '3MVG9KI2HHAq33RwG7rR_eq2UKqu0BLtoI7kGUAc5pDpRAF7mVmUrOw4WdcMzVjaUSpAqqzq0yfv4kVowu3kM',
                                 :client_secret => '8335121312097991471'

ActiveForce.sfdc_client = restforce_client
