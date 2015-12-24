require 'active_force'
require_relative 'models/job_application'
require_relative 'models/position'
require_relative 'models/candidate'

Restforce.configure do |config|
  config.api_version = "32.0"
end

ActiveForce.sfdc_client = Restforce.new :username => 'branden.bellanca@gmail.com',
                                        :password => 'Bellanca2468',
                                        :security_token => '8cC9a3NnPLhTF8BNJmM4PjIny',
                                        :client_id => '3MVG9KI2HHAq33RwG7rR_eq2UKqu0BLtoI7kGUAc5pDpRAF7mVmUrOw4WdcMzVjaUSpAqqzq0yfv4kVowu3kM',
                                        :client_secret => '8335121312097991471'


ActiveForce.sfdc_client.describe Position.table_name