class PositionEditPage
  include PageObject
  include PageObject::PageFactory

  text_field(:position_title, xpath: "//*[text() ='Position Title']//following::td[1]//input[@type='text']")
  select_list(:type, xpath: "//*[text() ='Type']//following::td[1]//select")
  select_list(:functional_area, xpath: "//*[text() ='Functional Area']//following::td[1]//select")
  select_list(:job_level, xpath: "//*[text() ='Job Level']//following::td[1]//select")
  text_field(:min_pay, xpath: "//*[text() ='Min Pay']//following::td[1]//input[@type='text']")
  text_field(:max_pay, xpath: "//*[text() ='Max Pay']//following::td[1]//input[@type='text']")
  button(:save, name: 'save')

  select_list(:record_type_choice, xpath: "//*[text() ='Record Type of new record']//following::td[1]//select")
  button(:continue, value: 'Continue')

  def choose_position_record_type(record_type)
    self.record_type_choice = record_type
    self.continue
    self.wait_until { self.position_title? }
  end

  def save_new_position
    self.save
    Janitor.add_mess PositionMess.new(on(PositionPage).position_title)
  end

end