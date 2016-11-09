class Payment < ActiveRecord::Base
  belongs_to :loan
  monetize :amount_cents
end
