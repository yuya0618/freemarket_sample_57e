module ApplicationHelper

  def insert_price(price)
    price = "¥" + price.to_s
  end

  def insert_name(name)
    name = name + "さんの投稿"
  end

end
