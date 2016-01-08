require 'models/job_application'
class JobApplicationMess
  attr_reader :job_application

  def initialize(name)
    @job_application = JobApplication.find_by(name: name)
  end

  def clean
    @job_application.reload.destroy
  end

end