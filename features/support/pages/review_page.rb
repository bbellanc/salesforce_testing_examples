class ReviewPage
  include PageForce

  self.sfdc_object_label_name = 'Review'

  sfdc_field(:job_application, 'Job Application')
  sfdc_field(:rating, 'Rating')

  button(:save_review, name: 'save')


end
