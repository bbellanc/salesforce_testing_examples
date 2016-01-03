require 'models/job_application'
class JobApplicationMess

  def initialize(name)
    @job_application = JobApplication.find_by(name: name)
  end

  def clean
    @job_application.destroy
  end

end