require 'rails_helper'

RSpec.describe Payment, type: :model do 

  describe 'validations' do 
    let(:loan)                { Loan.create(funded_amount_cents: loan_funded_amount_cents) }
    let(:payment)             { Payment.new(amount_cents: payment_amount_cents, loan: loan) }

    context "a valid payment" do 

      context "a payment that's less than it's loan's funded amount" do 
        let(:loan_funded_amount_cents) { 10_00 }
        let(:payment_amount_cents)     { 2_00 }

        it 'saves without an error' do 
          expect{ payment.save! }.not_to raise_error
        end
      end

      context "a payment that's equal to it's loan's funded amount" do 
        let(:loan_funded_amount_cents) { 10_00 }
        let(:payment_amount_cents)     { 10_00 }

        it 'saves without an error' do 
          expect{ payment.save! }.not_to raise_error
        end
      end
    end

    context 'an invalid payment' do 

      context "a payment who's amount exceeds it's loan's funded amount" do 
        let(:loan_funded_amount_cents) { 10_00 }
        let(:payment_amount_cents)     { 10_01 }

        it 'throws a validation error on save' do 
          expect{ payment.save! }.to raise_error(/Validation failed: Amount too large/)
        end
      end
    end
  end
end