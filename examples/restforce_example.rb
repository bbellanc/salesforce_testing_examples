$LOAD_PATH.unshift(File.join(__dir__, '..'))

require 'restforce'
require 'yaml'

#Pulling credentials from YAML
connected_app = YAML.load_file("#{Dir.home}/connected_app.yml")

#Configure Restforce with your connected app
Restforce.configure do |config|
  config.api_version   = "28.0"
  config.client_id     = connected_app[:app][:client_id]
  config.client_secret = connected_app[:app][:client_secret]
end

#Establish a connection
restforce_data_client = Restforce.new username: connected_app[:credentials][:admin][:username],
                                 password: connected_app[:credentials][:admin][:password],
                                 security_token: connected_app[:credentials][:admin][:security_token]

#Query with SOQL
restforce_data_client.query('select id from Candidate__c')

#Describe the metadata of a SF Object
restforce_data_client.describe 'Candidate__c'

#Describe all the layout metadata for a SF Object
restforce_data_client.describe_layouts 'Candidate__c'

# Find all occurrences of 'Engineer' in your org
restforce_data_client.search('FIND {Engineer}')