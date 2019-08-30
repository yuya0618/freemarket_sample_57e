class CreditCardsController < ApplicationController
  require "payjp"
  def step5
  end
  private
  def get_payjp_info
    if Rails.env == 'development'
      Payjp.api_key = ENV["sk_test_039e6c61ca2566c93c819a76"]
    else
      Payjp.api_key = Rails.application.credentials.payjp[:sk_test_039e6c61ca2566c93c819a76]
    end
  end
end
