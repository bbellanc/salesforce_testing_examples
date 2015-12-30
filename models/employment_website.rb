class EmploymentWebsite < ActiveForce::SObject

  field :name, from: 'Name'
  field :web_address
  field :price_per_post
  field :maximum_budget


  # Use any validation from active record.
  validates :web_address, format:({ with: /(https?:\/\/)?([\da-z\.-]+)\.([a-z\.]{2,6})([\/\w \.-]*)*\/?/,
                                    message: "invalid web address format." })

  validates :web_address, :price_per_post, presence: true

end