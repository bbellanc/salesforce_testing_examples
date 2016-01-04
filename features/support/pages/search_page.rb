require_relative 'related_lists/job_application_results'
class SearchPage
  include PageObject

  sf_related_list(:job_application_results, JobApplicationResults, sflabel: 'Job Applications')

  def open_job_application(application_name)
    job_application_result = job_application_results.find { |job_application_result| job_application_result.job_application_name_element.text == application_name }
    job_application_result.job_application_name
  end

end