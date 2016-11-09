class Loan < ActiveRecord::Base
  has_many :payments
  monetize :funded_amount_cents
end
