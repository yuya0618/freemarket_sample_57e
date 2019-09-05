module CreditCardsHelper
  def card_info
    card = CreditCard.where(user_id: current_user.id).first
    Payjp.api_key = Rails.application.credentials.payjp[:PAYJP_PRIVATE_KEY]
    customer = Payjp::Customer.retrieve(card.customer)
    @default_card_information = customer.cards.retrieve(card.card)
    exp_month = @default_card_information.exp_month.to_s
    exp_year = @default_card_information.exp_year.to_s.slice(2,3)
    @info = exp_month + " / " + exp_year
    return @info
  end
end
