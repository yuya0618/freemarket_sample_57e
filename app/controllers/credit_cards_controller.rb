class CreditCardsController < ApplicationController
  require "payjp"

  def new
    card = CreditCard.where(user_id: current_user.id)
    redirect_to action: "show" if card.exists?
  end

  #payjpとCardのデータベース作成を実施する。
  def pay
    Payjp.api_key = Rails.application.credentials.payjp[:PAYJP_PRIVATE_KEY]
    if params['payjp-token'].blank?
      redirect_to action: "new"
    else
      customer = Payjp::Customer.create(
      # email: current_user.email,
      card: params['payjp-token']
      )
      @card = CreditCard.new(user_id: current_user.id, customer: customer.id, card: customer.default_card)
      if @card.save
        redirect_to action: "show"
      else
        redirect_to action: "pay"
      end
    end
  end

  # def create
  #   token = Payjp::Token.create(
  #     number:    params['number'],
  #     cvc:       params['cvc'],
  #     exp_year:  params['exp_year'],
  #     exp_month: params['exp_month'],
  #   )
  #   # return token.id
  # end

  #PayjpとCardデータベースを削除する
  def delete
    card = CreditCard.where(user_id: current_user.id).first
    if card.blank?
    else
      Payjp.api_key = Rails.application.credentials.payjp[:PAYJP_PRIVATE_KEY]
      customer = Payjp::Customer.retrieve(card.customer)
      customer.delete
      card.delete
    end
    redirect_to action: "new"
  end

  #Cardのデータpayjpに送り情報を取り出す
  def show
    card = CreditCard.where(user_id: current_user.id).first
    if card.blank?
      redirect_to action: "new"
    else
      Payjp.api_key = Rails.application.credentials.payjp[:PAYJP_PRIVATE_KEY]
      customer = Payjp::Customer.retrieve(card.customer)
      @default_card_information = customer.cards.retrieve(card.card)
    end
  end
end
