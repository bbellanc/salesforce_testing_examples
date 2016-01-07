require 'page-object'
require_relative 'restforce_client'
require 'page-force'

PageForce::Config.sfdc_tooling_client = RestForceClient.establish_connection_to_tooling_api

class PositionPage
  include PageForce

  self.sfdc_object_label_name = 'Position'

  sfdc_field :job_level, sfdc_label: 'Job Level'
  sfdc_field :status, sfdc_label: 'Status'
  sfdc_field :hiring_manager, sfdc_label: 'Hiring Manager'
end

@browser = Watir::Browser.new :chrome

@browser.goto('login.salesforce.com')
@browser.wait_until { @browser.text_field(id: 'username').exist? }
@browser.text_field(id: 'username').set 'branden.bellanca@gmail.com.dev'
@browser.text_field(id: 'password').set 'Winter15'
@browser.button(name: 'Login').click
@browser.wait_until {@browser.link(title: 'Positions Tab').exists?}
@browser.link(title: 'Positions Tab').click
page = PositionPage.new(@browser)
page.job_level
page.status
page.hiring_manager


at_exit do
  @browser.close
end
