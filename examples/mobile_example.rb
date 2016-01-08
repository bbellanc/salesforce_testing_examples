require 'page-force'
include PageObject::PageFactory

CONNECTED_APP_DATA = YAML.load_file("#{Dir.home}/connected_app.yml")

#Choose a device to simulate
mobile_emulation = {"deviceName" => "Apple iPad"}

#Add it as a chrome option for the Selenium capabilities
caps = Selenium::WebDriver::Remote::Capabilities.chrome("chromeOptions" => {"mobileEmulation" => mobile_emulation})

#Pass the capabilities to webdriver
@browser = Watir::Browser.new :chrome, desired_capabilities: caps
@browser.window.resize_to 768, 1024

@browser.goto('login.salesforce.com')
@browser.wait_until { @browser.text_field(id: 'username').exist? }
@browser.text_field(id: 'username').set CONNECTED_APP_DATA[:credentials][:admin][:username]
@browser.text_field(id: 'password').set CONNECTED_APP_DATA[:credentials][:admin][:password]
@browser.button(name: 'Login').click
