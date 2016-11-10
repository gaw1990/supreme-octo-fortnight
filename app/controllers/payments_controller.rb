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
    @payment = Payment.new(payment_params)
    if @payment.save!
      render json: 'success', status: 200
    else 
      render json: @payment.errors.full_messages
    end
  end

  private 

  def payment_params 
    params.permit(:amount_cents)
  end 
end