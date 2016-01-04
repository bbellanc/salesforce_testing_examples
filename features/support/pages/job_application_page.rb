class JobApplicationPage
  include PageObject

  button(:new_review ,value: 'New Review')
  sf_field(:total_rating, sflabel: 'Total Rating')
  sf_field(:number_of_reviews, sflabel: 'Number of Reviews')
  sf_field(:average_rating, sflabel: 'Average Rating')


  def calculated_average_rating
    BigDecimal.new self.average_rating
  end


  def create_new_review

  end
end