require 'page-object'
class ApprovalPage
  include PageObject

  button(:approve, value: 'Approve')
end