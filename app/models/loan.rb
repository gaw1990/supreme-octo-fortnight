class Loan < ActiveRecord::Base
  has_many :payments
  monetize :funded_amount_cents

  def as_json(options = {})
    super.merge({'outstanding_balance_cents': outstanding_balance_cents})
  end

  def outstanding_balance_cents
    funded_amount_cents - payments.sum(:amount_cents)
  end
end
