$LOAD_PATH.unshift(File.join(__dir__, '..'))

require 'watir-webdriver'
require 'active_force'
require 'models/position'
require 'models/candidate'

Restforce.configure { |config| config.api_version = "35.0" }
restforce_client = Restforce.new :username => 'branden.bellanca@gmail.com.dev',
                                 :password => 'Bellanca2468',
                                 :security_token => '8cC9a3NnPLhTF8BNJmM4PjIny',
                                 :client_id => '3MVG9KI2HHAq33RwG7rR_eq2UKqu0BLtoI7kGUAc5pDpRAF7mVmUrOw4WdcMzVjaUSpAqqzq0yfv4kVowu3kM',
                                 :client_secret => '8335121312097991471'

ActiveForce.sfdc_client = restforce_client

browser = Watir::Browser.new :chrome
browser.goto('login.salesforce.com')
browser.text_field(id: 'username').set 'branden.bellanca@gmail.com.dev'
browser.text_field(id: 'password').set 'Bellanca2468'
browser.button(name: 'Login').click

Position.first


