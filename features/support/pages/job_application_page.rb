class JobApplicationPage
  include PageForce
  include PageObject::PageFactory

  self.sfdc_object_label_name = 'Job Application'

  button(:new_review ,value: 'New Review')
  sf_field(:total_rating, sflabel: 'Total Rating')
  sf_field(:number_of_reviews, sflabel: 'Number of Reviews')
  sf_field(:average_rating, sflabel: 'Average Rating')


  def calculated_average_rating
    BigDecimal.new self.average_rating
  end

  def create_new_review
    self.new_review
    self.wait_until { on(ReviewPage).rating }
  end

end