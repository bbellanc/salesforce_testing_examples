class JobApplicationResults
  include PageObject

  link(:job_application_name, xpath: './th/a' )
end