When(/^a new position is created$/) do
  @browser.goto('login.salesforce.com')
  @browser.text_field(id: 'username').set 'branden.bellanca@gmail.com.dev'
  @browser.text_field(id: 'password').set 'Winter15'
  sleep(1)
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
  @browser.text_field(xpath: "//*[text() ='Min Pay']//following::td[1]//input[@type='text']").set '50000'
  @browser.text_field(xpath: "//*[text() ='Max Pay']//following::td[1]//input[@type='text']").set '70000'
  @browser.button(name: 'save').click
  Janitor.add_mess PositionMess.new(@position_title)
end

Then(/^the position is assigned to the queue$/) do
  position_owner = @browser.td(xpath: "//*[text() ='Owner']//following::td[1]").text
  expect(position_owner).to include 'Unclaimed Positions Queue'
end

And(/^the recruiters are emailed an assignment for that position$/) do
  position_assignment_email = Mail.last
  expect(position_assignment_email.subject).to eq  'Position transferred to you.'
  expect(position_assignment_email.body).to include "Position #{@position_title} has been assigned to you"
end

Given(/^I am a Universal Container recruiter$/) do
  on(LoginPage).login_as_recruiter
end

When(/^I send a new position for approval$/) do
  pending
end

And(/^my manager approves it$/) do
  pending
end

Then(/^then the position is approved$/) do
  pending
end

Given(/^a job application for a position$/) do
  pending
end

When(/^I write a review for the application$/) do
  pending
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

