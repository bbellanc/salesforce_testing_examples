$LOAD_PATH.unshift(File.join(__dir__, '..'))

require 'watir-webdriver'
require 'active_force'
require 'models/position'
require 'models/candidate'
require 'restforce_client'

ActiveForce.sfdc_client = RestForceClient.create_connection

browser = Watir::Browser.new :chrome
browser.goto('login.salesforce.com')
browser.text_field(id: 'username').set 'branden.bellanca@gmail.com.dev'
browser.text_field(id: 'password').set 'Bellanca2468'
browser.button(name: 'Login').click

position_id = Position.find_by().id

#goto a record
@browser.goto("https://na34.salesforce.com/#{position_id}")


