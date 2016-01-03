$LOAD_PATH.unshift(File.join(__dir__, '..'))
require 'awesome_print'
require 'activeforce'
require 'restforce_client'
require 'models/position'
require 'models/employment_website'

ActiveForce.sfdc_client = RestForceClient.create_connection

#Get a Salesforce Record based on index
position = Position.first

#Or based on criteria
qa_architect_position = Position.find_by(position_title: 'QA Architect')

#Use SOQL to find the record you need
sr_beni_specialist_position = Position.find_by("name like '%Benefits Specialist'")

it_positions = Position.where(functional_area: 'Information Technology')

#association can be made with other related objects
job_apps_for_sr_beni_position = sr_beni_specialist_position.job_applications

#minipulate existing objects
qa_architect_position.requires_java = true
qa_architect_position.save
qa_architect_position.requires_java = false
qa_architect_position.save

#create new objects
new_employment_website = EmploymentWebsite.create!(
    name: 'Craigslist',
    web_address: 'craigslist.com',
    price_per_post: 1,
    maximum_budget: 12)

# delete an object
new_employment_website.destroy




