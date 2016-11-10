class Payment < ActiveRecord::Base

  validate :does_not_exceed_outstanding_balance

  belongs_to :loan
  monetize :amount_cents

  def does_not_exceed_outstanding_balance
    if (loan.outstanding_balance_cents - amount_cents) < 0 
      errors.add(:amount_too_large, "Please try a payment amount that does not exceed the current outstanding balance of the loan.")
    end 
  end
end
