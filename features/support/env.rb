$LOAD_PATH << File.join(__dir__, '..', '..')

require 'activeforce'
require 'page-object'
require 'page-force'
require 'restforce_client'
require 'mail'

CONNECTED_APP_DATA = YAML.load_file("#{Dir.home}/connected_app.yml")

Mail.defaults do
  retriever_method :pop3, :address => "pop.gmail.com",
                   :port       => 995,
                   :user_name  =>  CONNECTED_APP_DATA[:credentials][:email][:username],
                   :password   =>  CONNECTED_APP_DATA[:credentials][:email][:password],
                   :enable_ssl => true
end

#Establish the client
ActiveForce.sfdc_client = RestForceClient.establish_connection_to_rest_api
PageForce::Config.sfdc_tooling_client = RestForceClient.establish_connection_to_tooling_api

World PageObject::PageFactory
