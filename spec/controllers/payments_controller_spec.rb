require 'rails_helper'

RSpec.describe PaymentsController, type: :controller do
  let!(:loan)         { Loan.create(funded_amount_cents: 100_00) }
  let!(:payment)      { Payment.create!(amount_cents: 1_00, loan: loan) }

  describe '#index' do

    it 'responds with a 200' do
      get :index, loan_id: loan.id
      expect(response).to have_http_status(:ok)
    end
  end

  describe '#show' do

    it 'responds with a 200' do
      get :show, id: payment.id
      expect(response).to have_http_status(:ok)
    end

    context 'if the payment is not found' do
      it 'responds with a 404' do
        get :show, id: (payment.id + 1)
        expect(response).to have_http_status(:not_found)
      end
    end
  end
end