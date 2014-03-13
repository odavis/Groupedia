class ChargesController < ApplicationController
  def new
  end

  def create

    customer = Stripe::Customer.create(
      :email => current_user.email,
      :card  =>  params[:stripeToken],
      :plan => "blocipedia-subscription"
      )

    if current_user.subscription.update_attribute(:customerid, customer.id)
      current_user.subscription.update_attribute(:account, "premium")
    end

    @amount = (customer.subscription.plan.amount)/100.00

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to charges_path
  end
end
