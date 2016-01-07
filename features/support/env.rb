$LOAD_PATH << File.join(__dir__, '..', '..')

require 'activeforce'
require 'page-object'
require 'page-force'
require 'restforce_client'
require 'mail'

Mail.defaults do
  retriever_method :pop3, :address => "pop.gmail.com",
                   :port       => 995,
                   :user_name  => 'ucontainertest',
                   :password   => 'Bellanca2468',
                   :enable_ssl => true
end


#Establish the client
ActiveForce.sfdc_client = RestForceClient.establish_connection_to_rest_api
PageForce::Config.sfdc_tooling_client = RestForceClient.establish_connection_to_tooling_api

World PageObject::PageFactory
