require 'page-object'
class HomePage
  include PageObject
  include PageObject::PageFactory
  table(:items_to_approve, xpath: "//*[text()='Items to Approve']/following::table")
  link(:home_tab, text: 'Home')
  div(:create_new_object, id: 'createNewButton')
  img(:create_new_position, title: 'Position')

  text_field(:search_bar, id: 'phSearchInput')
  button(:search, id: 'phSearchButton')

  def create_position_from_create_new_sidebar
    self.create_new_object_element.click
    self.create_new_position_element.click
    self.wait_until { on(PositionEditPage).position_title? || on(PositionEditPage).record_type_choice? }
  end

  def open_approval_for_position(position_name)
    approval_line_item = self.items_to_approve_element.find { |approval| approval[1].text == position_name }
    approval_line_item[0].link(text: 'Approve / Reject').click
  end

  def search_salesforce_for(search_criteria)
    self.search_bar = search_criteria
    self.search
  end
end