class ReviewPage
  include PageForce

  self.sfdc_object_label_name = 'Review'

  sfdc_field(:job_application, sfdc_label: 'Job Application')
  sfdc_field(:rating, sfdc_label: 'Rating')

  button(:save_review, name: 'save')


end
