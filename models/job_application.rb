class JobApplication < ActiveForce::SObject
  self.table_name = 'Job_Application__c'

  field :name, from: 'Name'
  field :candidate
  field :position_id, from: 'Position__c'
  field :status

  belongs_to :position, foreign_key: 'position_id'

end