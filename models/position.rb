class Position < ActiveForce::SObject

  field :name, from: 'Name'
  field :min_pay

  has_many :job_applications


end