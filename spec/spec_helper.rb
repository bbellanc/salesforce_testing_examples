$LOAD_PATH.unshift(File.join(__dir__, '..'))
require 'rspec'
require 'active_force'
require 'models/job_application'
require 'models/position'
require 'models/candidate'
require 'models/user'

client = RestForceClient.create_connection

ActiveForce.sfdc_client = restforce_client
