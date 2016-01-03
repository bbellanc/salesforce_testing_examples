# require 'activeforce'
# require_relative 'models/job_application'
# require_relative 'models/position'
# require_relative 'models/candidate'
# require_relative 'models/user'

# Restforce.configure do |config|
#   config.api_version = "35.0"
# end
#
# ActiveForce.sfdc_client = Restforce.new username: 'branden.bellanca@gmail.com.dev',
#                                         password: 'Winter15',
#                                         :client_id => '3MVG9KI2HHAq33RwG7rR_eq2UKqu0BLtoI7kGUAc5pDpRAF7mVmUrOw4WdcMzVjaUSpAqqzq0yfv4kVowu3kM',
#                                         :client_secret => '8335121312097991471',
#                                         security_token: 'gje3S5L1NemTEZQLJlyH4XNRS'
#
#
# p ActiveForce.sfdc_client.describe 'User'

# require 'databasedotcom'
#
# client = Databasedotcom::Client.new :client_id => '3MVG9KI2HHAq33RwG7rR_eq2UKqu0BLtoI7kGUAc5pDpRAF7mVmUrOw4WdcMzVjaUSpAqqzq0yfv4kVowu3kM',
#                                     :client_secret => '8335121312097991471',
#                                     version: '28.0'
#
# client.instance_url = 'https://na34.salesforce.com'
# client.authenticate :username => 'branden.bellanca@gmail.com.dev', :password => 'Winter15gje3S5L1NemTEZQLJlyH4XNRS'
# p client.oauth_token
#
# client.materialize('Position__c')
# client.materialize('Job_Application__c')
#
# puts Position.first.methods - Object.methods

require 'mail'

Mail.defaults do
  retriever_method :pop3, :address => "pop.gmail.com",
                   :port       => 995,
                   :user_name  => 'ucontainertest',
                   :password   => 'Bellanca2468',
                   :enable_ssl => true
end

Mail.last.body