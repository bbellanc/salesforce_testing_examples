class LoginPage
  include PageObject
  include PageObject::PageFactory

  page_url 'login.salesforce.com'

  text_field(:username, id: 'username')
  text_field(:password, id: 'password')
  button(:login, name: 'Login')

  def login_as_recruiter
    self.wait_until { self.username? }
    self.username = CONNECTED_APP_DATA[:credentials][:recruiter][:username]
    self.password = CONNECTED_APP_DATA[:credentials][:recruiter][:password]
    self.login
    self.wait_until { on(HomePage).create_new_object? }
  end

  def login_as_recruiting_manager
    self.wait_until { self.username? }
    self.username = CONNECTED_APP_DATA[:credentials][:admin][:username]
    self.password = CONNECTED_APP_DATA[:credentials][:admin][:password]
    self.login
    self.wait_until { on(HomePage).home_tab? }
    on(HomePage).home_tab
    self.wait_until { on(HomePage).create_new_object? }

  end
end