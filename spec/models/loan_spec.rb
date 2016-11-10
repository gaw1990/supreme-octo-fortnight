require 'rails_helper'

RSpec.describe Loan, type: :model do 
  
  describe 'loan#as_json' do 
    let(:loan) { Loan.create(funded_amount_cents: funded_amount_cents) } 
    let(:funded_amount_cents) { 100_00 }

    context 'a loan without payments' do 

      it 'returns a value for outstanding_balance_cents' do 
        expect(loan.as_json[:outstanding_balance_cents]).to be(100_00)
      end
    end

    context 'a loan with payments' do 
      let!(:payment1) { Payment.create(amount_cents: 20_00, loan: loan)}
      let!(:payment2) { Payment.create(amount_cents: 10_00, loan: loan)}

      it 'returns a value for outstanding_balance_cents that accounts for payments' do 
        expect(loan.as_json[:outstanding_balance_cents]).to be(70_00)
      end
    end
  end 
end