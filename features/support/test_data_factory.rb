class TestDataFactory
  class << self

    def create_position
      new_position = Position.create!(position_title: 'SQL Guy',
                                      type: 'Full Time',
                                      functional_area: 'Information Technology',
                                      job_level: 'IT-300',
                                      min_pay: 80500,
                                      max_pay: 95000
      )
      Janitor.add_mess(PositionMess.new('SQL Guy'))
      new_position
    end

    def create_job_application(position, candidate=Candidate.first.id)
      new_job_application = JobApplication.create!(position: position,
                                                   candidate: candidate,
                                                   status: 'New')
      Janitor.add_mess(JobApplicationMess.new(new_job_application.name))
      new_job_application
    end


  end
end