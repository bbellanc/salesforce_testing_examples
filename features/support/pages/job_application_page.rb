class JobApplicationPage
  include PageForce
  include PageObject::PageFactory

  self.sfdc_object_label_name = 'Job Application'

  button(:new_review ,value: 'New Review')
  sfdc_field(:total_rating, sfdc_label: 'Total Rating')
  sfdc_field(:number_of_reviews, sfdc_label: 'Number of Reviews')
  sfdc_field(:average_rating, sfdc_label: 'Average Rating')


  def calculated_average_rating
    BigDecimal.new self.average_rating
  end

  def create_new_review
    self.new_review
    self.wait_until { on(ReviewPage).rating }
  end

end