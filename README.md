# Payments Exercise

Add in the ability to create payments for a given loan using a JSON API call. You should store the payment date and amount. Expose the outstanding balance for a given loan in the JSON vended for `LoansController#show` and `LoansController#index`. The outstanding balance should be calculated as the `funded_amount` minus all of the payment amounts.

A payment should not be able to be created that exceeds the outstanding balance of a loan. You should return validation errors if a payment can not be created. Expose endpoints for seeing all payments for a given loan as well as seeing an individual payment.


##Quick notes: 

1. Stylistically I wrote the app as if it were being consumed by other machines, so I used columns like funded_amount_cents in my JSON responses instead of funded_amount because I feel they're less prone to error and can be easily translated to something human readable later on if needed. (In app the monetize gem makes this easy as you can still call Loan#funded_amount and get a Money object that represents the amount in dollars).
2. Payment Date: I didn't add an extra column for payment date, I think created_at covers it. If we had any date restrictions as to when a payment could be made (ie. weekends/non-bank holidays only) then maybe an effective_date or processed_date column could be helpful, but I just didn't think it was needed for this app.
3. Brief API Documentation: 

Resource#Action | Pattern | Verb
------------- |:-------------:| -----:
loans#index | /loans | GET
loans#show | /loans/:id | GET
payments#index  | /loans/:loan_id/payments | GET 
payments#show | /payments/:id | GET
payments#create | /loans/:loan_id/payments | POST

4. This is my first API with rails, it's not perfect, but I'd be happy to discuss/defend any of my decisions. Please reach out with any questions 

Thanks for the opportunity! George
