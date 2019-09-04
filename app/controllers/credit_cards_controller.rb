class CreditCardsController < ApplicationController
  require "payjp"
  Payjp.api_key =  Rails.application.credentials.payjp[:PAYJP_SECRET_KEY]

  def create
    binding.pry
    token = Payjp::Token.create(
      number:    params['number'],
      cvc:       params['cvc'],
      exp_year:  params['exp_year'],
      exp_month: params['exp_month'],
    )
    # return token.id
  end

  def pay #payjpとCardのデータベース作成を実施します。
    Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
    if params['payjp-token'].blank?
      redirect_to action: "new"
    else
      customer = Payjp::Customer.create(
      description: '登録テスト', #なくてもOK
      email: current_user.email, #なくてもOK
      card: params['payjp-token'],
      metadata: {user_id: current_user.id}
      ) #念の為metadataにuser_idを入れましたがなくてもOK
      @card = Card.new(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card)
      if @card.save
        redirect_to action: "show"
      else
        redirect_to action: "pay"
      end
    end
  end

  #PayjpとCardデータベースを削除します
  def delete
    card = Card.where(user_id: current_user.id).first
    if card.blank?
    else
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      customer = Payjp::Customer.retrieve(card.customer_id)
      customer.delete
      card.delete
    end
      redirect_to payment_user_path(current_user.id)
  end

  #Cardのデータpayjpに送り情報を取り出します
  def show
    card = Card.where(user_id: current_user.id).first
    if card.blank?
      redirect_to payment_user_path(current_user.id)
    else
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      customer = Payjp::Customer.retrieve(card.customer_id)
      @default_card_information = customer.cards.retrieve(card.card_id)
    end
  end
end
