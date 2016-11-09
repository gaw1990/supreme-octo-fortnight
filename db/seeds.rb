10.times do 
  Loan.create!(funded_amount_cents: 100_00)
end

15.times do 
  Payment.create!(amount_cents: 5_00, loan: Loan.order("RANDOM()").first)
end