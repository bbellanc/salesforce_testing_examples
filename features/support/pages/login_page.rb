class LoginPage
  include PageObject
  include PageObject::PageFactory

  page_url 'login.salesforce.com'

  text_field(:username, id: 'username')
  text_field(:password, id: 'password')
  button(:login, name: 'Login')

  def login_as_recruiter
    self.wait_until { self.username? }
    self.username = 'recruiter@ucontainers.com'
    self.password = 'Winter16'
    self.login
    self.wait_until { on(HomePage).create_new_object? }
  end

  def login_as_recruiting_manager
    self.wait_until { self.username? }
    self.username = 'branden.bellanca@gmail.com.dev'
    self.password = 'Winter15'
    self.login
    self.wait_until { on(HomePage).home_tab? }
    on(HomePage).home_tab
    self.wait_until { on(HomePage).create_new_object? }

  end
end