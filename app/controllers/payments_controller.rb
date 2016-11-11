class PaymentsController < ApplicationController

  rescue_from ActiveRecord::RecordNotFound do |exception|
    render json: 'not_found', status: :not_found
  end

  def index 
    render json: Payment.where(loan_id: params[:loan_id])
  end
  
  def show 
    render json: Payment.find(params[:id])
  end

  def create 
    loan = Loan.find(payment_params[:loan_id])
    payment = loan.payments.new(payment_params[:payment])

    if payment.save
      render json: 'success', status: 200
    else 
      render json: {errors: payment.errors}, status: 422
    end
  end

  private 

  def payment_params 
    params.permit(:loan_id, payment: [ :amount_cents ])
  end 
end