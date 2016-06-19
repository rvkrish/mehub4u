class PaypalPaymentController < ApplicationController
  
  def index
  end

  def return_url
  end

  def cancle_url
  end

  def send_payment
    if params[:cardNumber].present?
        response = STANDARD_GATEWAY.purchase(100,credit_card,standard_purchase_options)
        unless response.success?
          flash[:error] = "Invalid Credit Card Details"
          redirect_to root_path
        else
          flash[:success] = "Your card has been processed successfully !!!!"
        end 
    else  
      response = EXPRESS_GATEWAY.setup_purchase(100,
      :ip                => request.remote_ip,
      :return_url        => paypal_payment_return_url_url,
      :cancel_return_url => paypal_payment_cancle_url_url
      )
      redirect_to EXPRESS_GATEWAY.redirect_url_for(response.token)
    end  
  end
  
  private

  #Test Standered purchase options
  def standard_purchase_options
    {
      :ip => request.remote_ip,
      :billing_address => {
        :name     => "Ryan Bates",
        :address1 => "123 Main St.",
        :city     => "New York",
        :state    => "NY",
        :country  => "US",
        :zip      => "10001"
      }
    }
  end

  #Prepare credit card for processing the information.
  def credit_card
    @credit_card ||= ActiveMerchant::Billing::CreditCard.new(
        type:                params[:cardType],
        number:              params[:cardNumber],
        verification_value:  params[:cvCode],
        month:               params[:expMonth],
        year:                params[:expYear],
        first_name:          "Fisrt Name",
        last_name:           "Last Name"
    )
  end
end
