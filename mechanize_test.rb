require 'mechanize'

agent = Mechanize.new { |agent|
  agent.user_agent_alias = 'Mac Safari'
}

login_page = agent.get('https://na34.salesforce.com/')


my_page = login_page.form_with(:name => 'login') do |f|
  f.field_with(id: 'username').value = 'branden.bellanca@gmail.com.dev'
  f.field_with(id: 'password').value = 'Bellanca2468'
  f.field_with(name: 'un').value = 'branden.bellanca@gmail.com.dev'
  f.field_with(name: 'width').value = '1280'
  f.field_with(name: 'height').value = '800'
end.submit

