$LOAD_PATH.unshift(File.join(__dir__, '..'))

require 'watir-webdriver'
require 'activeforce'
require 'models/position'
require 'models/candidate'
require 'restforce_client'

#Establish the client
ActiveForce.sfdc_client = RestForceClient.create_connection

@browser = Watir::Browser.new :chrome
@browser.goto('login.salesforce.com')
@browser.text_field(id: 'username').set 'branden.bellanca@gmail.com.dev'
@browser.text_field(id: 'password').set 'Winter15'
@browser.button(name: 'Login').click

position_id = Position.find_by(name: 'QA Engineer').id

#goto straight to a record
@browser.goto("https://na34.salesforce.com/#{position_id}")

#Or do a search like a user
@browser.text_field(id: 'phSearchInput').set 'Sr. SQA Engineer'
@browser.button(id: 'phSearchButton').click

@browser.link(text: 'Sr. SQA Engineer').click
