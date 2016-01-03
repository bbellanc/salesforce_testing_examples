class PositionPage
  include PageObject

  cell(:position_title, xpath: "//*[text() ='Position Title']//following::td[1]")
  cell(:type, xpath: "//*[text() ='Type']//following::td[1]")
  cell(:position_status, xpath: "//*[text() ='Status']//following::td[1]")
  cell(:functional_area, xpath: "//*[text() ='Functional Area']//following::td[1]")
  cell(:job_level, xpath: "//*[text() ='Job Level']//following::td[1]")
  cell(:min_pay, xpath: "//*[text() ='Min Pay']//following::td[1]")
  cell(:max_pay, xpath: "//*[text() ='Max Pay']//following::td[1]")
  button(:save, name: 'save')
  button(:send_for_approval, value: 'Submit for Approval')
  span(:overall_approval_status ,class: 'extraStatus')


  def send_position_for_approval
    self.confirm(true) do
      self.send_for_approval
    end
  end
end