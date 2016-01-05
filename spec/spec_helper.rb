$LOAD_PATH.unshift(File.join(__dir__, '..'))
require 'rspec'
require 'activeforce'
require 'restforce_client'
require 'models/job_application'
require 'models/position'
require 'models/candidate'
require 'models/user'

ActiveForce.sfdc_client = RestForceClient.create_connection
