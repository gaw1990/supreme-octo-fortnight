require 'rails_helper'

RSpec.describe PaymentsController, type: :controller do
  let!(:loan)         { Loan.create(funded_amount_cents: 100_00) }
  let(:payment)      { Payment.create!(amount_cents: 1_00, loan: loan) }

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

  describe '#create' do 

    context 'valid request/payment' do 

      it 'responds with a 200' do 
        post :create, payment: { amount_cents: 100_00 }, loan_id: loan.id
        expect(response).to have_http_status(:ok)
      end

      it 'creates a new payment' do
        expect { 
          post :create, payment: { amount_cents: 100_00 }, loan_id: loan.id
        }.to change{ loan.payments.count }.by(1)
      end
    end

    context 'invalid request/payment' do 

      context 'when the loan is not found' do

        it 'responds with a 404' do 
          post :create, payment: { amount_cents: 10_00 }, loan_id: (loan.id + 1)
          expect(response).to have_http_status(:not_found)
        end
      end

      context 'when the payment amount exceeds the outstanding balance of the loan' do

        it 'responds with a 422' do 
          post :create, payment: { amount_cents: 100_01 }, loan_id: loan.id
          expect(response).to have_http_status(422)
          expect(response.body).to include('amount_too_large')
        end
  
        it 'does not create a new payment' do
          expect { 
            post :create, payment: { amount_cents: 100_01 }, loan_id: loan.id
          }.not_to change{ loan.payments.count }
        end
      end
    end
  end
end