#### Watir-Webdriver only example ####

When(/^a new position is created$/) do
  @browser.goto('login.salesforce.com')
  @browser.wait_until { @browser.text_field(id: 'username').exist? }
  @browser.text_field(id: 'username').set 'branden.bellanca@gmail.com.dev'
  @browser.text_field(id: 'password').set 'Winter15'
  @browser.button(name: 'Login').click

  @browser.wait_until { @browser.a(text: 'Home').exist? }
  @browser.a(text: 'Home').click

  @browser.wait_until { @browser.div(id: 'createNewButton').exist? }
  @browser.div(id: 'createNewButton').click
  @browser.img(title: 'Position').click

  @position_title = 'Finance Guy'
  @browser.text_field(xpath: "//*[text() ='Position Title']//following::td[1]//input[@type='text']").set @position_title
  @browser.select_list(xpath: "//*[text() ='Type']//following::td[1]//select").select 'Full Time'
  @browser.select_list(xpath: "//*[text() ='Functional Area']//following::td[1]//select").select 'Finance'
  @browser.select_list(xpath: "//*[text() ='Job Level']//following::td[1]//select").select 'FN-100'
  @browser.text_field(xpath: "//*[text() ='Min Pay']//following::td[1]//input[@type='text']").set 50000
  @browser.text_field(xpath: "//*[text() ='Max Pay']//following::td[1]//input[@type='text']").set 70000
  @browser.button(name: 'save').click
  @browser.wait_until { @browser.td(xpath: "//*[text() ='Owner']//following::td[1]").exist? }
  Janitor.add_mess PositionMess.new(@position_title)
end

Then(/^the position is assigned to the queue$/) do
  position_owner = @browser.td(xpath: "//*[text() ='Owner']//following::td[1]").text
  expect(position_owner).to include 'Unclaimed Positions Queue'
end

And(/^the recruiters are emailed an assignment for that position$/) do
  position_assignment_email = Mail.last
  expect(position_assignment_email.subject).to eq 'Position transferred to you.'
  expect(position_assignment_email.body).to include "Position #{@position_title} has been assigned to you"
end


#### Page-Object example ####

Given(/^I am a Universal Container recruiter$/) do
  visit(LoginPage).login_as_recruiter
end

When(/^I send a new position for approval$/) do
  on(HomePage).create_position_from_create_new_sidebar
  on(PositionEditPage).choose_position_record_type('IT Position')
  @position_title = 'IT Guy'
  on(PositionEditPage)do |page|
    page.position_title  = @position_title
    page.type            = 'Part Time'
    page.functional_area = 'Information Technology'
    page.job_level       = 'IT-200'
    page.min_pay         =  10000
    page.max_pay         =  20000
    page.save_new_position
  end
  on(PositionPage).send_position_for_approval
end

And(/^my manager approves it$/) do
  visit(LoginPage).login_as_recruiting_manager
  on(HomePage).open_approval_for_position(@position_title)
  on(ApprovalPage).approve

end

Then(/^the position is set to an open - approved status$/) do
  expect(on(PositionPage).overall_approval_status).to eq 'Approved'
  expect(on(PositionPage).position_status).to eq 'Open - Approved'
end

Given(/^a job application for a position$/) do
  @position = TestDataFactory.create_position
  @job_application = TestDataFactory.create_job_application(@position.id)
end

When(/^I write a review for the application$/) do
  visit(LoginPage).login_as_recruiter
  on(HomePage).search_salesforce_for(@job_application.name)
  on(SearchPage).open_search_result(@job_application.name)
end

And(/^another interviewer writes a review$/) do
  pending
end

Then(/^the job application is updated with the number of reviews$/) do
  pending
end

And(/^the job application is updated with the average score of the reviews$/) do
  pending
end

