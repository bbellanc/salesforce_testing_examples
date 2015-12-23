class Position < ActiveForce::SObject

  field :name, from: 'Name'

  has_many :job_applications


end