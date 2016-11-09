10.times do 
  Loan.create!(funded_amount_cents: 100_00)
end

20.times do 
  Payment.create!(amount_cents: 10_00, loan: Loan.order("RANDOM()").first)
end