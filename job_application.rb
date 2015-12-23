class JobApplication < ActiveForce::SObject
  self.table_name = 'Job_Application__c'

  field :candidate
  field :position_id, from: 'Position__c'
  belongs_to :position, foreign_key: 'position_id'

end