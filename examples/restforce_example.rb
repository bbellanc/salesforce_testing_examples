$LOAD_PATH.unshift(File.join(__dir__, '..'))

require 'restforce'

Restforce.configure do |config|
  config.api_version   = "28.0"
  config.client_id     = '3MVG9KI2HHAq33RwG7rR_eq2UKqu0BLtoI7kGUAc5pDpRAF7mVmUrOw4WdcMzVjaUSpAqqzq0yfv4kVowu3kM'
  config.client_secret = '8335121312097991471'

end

restforce_client = Restforce.new username: 'branden.bellanca@gmail.com.dev',
                                 password: 'Winter15',
                                 security_token: 'gje3S5L1NemTEZQLJlyH4XNRS'

candidates =restforce_client.query('select id from Candidate__c')

restforce_client.describe 'Candidate__c'

restforce_client.describe_layouts 'Candidate__c'

# Find all occurrences of 'Engineer'
restforce_client.search('FIND {Engineer}')