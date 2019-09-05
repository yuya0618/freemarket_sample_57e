# 開発環境の時に実行
if Rails.env == "development"
  # Image.create!(
  #   [
  #     {
  #       image: File.open("./app/assets/images/スカパラ.jpg"),
  #       item_id: "1",
  #     },
  #     {
  #       image: File.open("./app/assets/images/ellegarden.jpg"),
  #       item_id: "2",
  #     },
  #     {
  #       image: File.open("./app/assets/images/FtS0JIaySu25mzo2DK8JMHMoF4MKEBPtjdqoHam6.jpeg"),
  #       item_id: "3",
  #     },
  #     {
  #       image: File.open("./app/assets/images/fightclub.jpeg"),
  #       item_id: "4",
  #     },
  #   ]
  # )

  require 'csv'

  category_parents_array = CSV.read('db/categories/category_parents.csv')
  category_children_array = CSV.read('db/categories/category_children.csv')
  category_grandchildren_array = CSV.read('db/categories/category_grandchildren.csv')

  parents_records = []
  children_records = []

  category_parents_array.each do |parent|
    parents_records << Category.create(name: parent[0])
  end

  parents_count = 0

  category_children_array.each do |child|
    child != [] ? children_records << parents_records[parents_count].children.create(name: child[0]) : parents_count += 1
  end

  children_count = 0

  category_grandchildren_array.each do |gchild|
    gchild != [] ? children_records[children_count].children.create(name: gchild[0]) : children_count += 1
  end


  CSV.foreach('db/brands/brand_ladies.csv') do |brand|
    Brand.create(name: brand[0])
  end

  CSV.foreach('db/brands/brand_mens.csv') do |brand|
    Brand.create(name: brand[0])
  end

  CSV.foreach('db/brands/brand_baby_kids.csv') do |brand|
    Brand.create(name: brand[0])
  end

  CSV.foreach('db/brands/brand_interior.csv') do |brand|
    Brand.create(name: brand[0])
  end

  CSV.foreach('db/brands/brand_kitchen.csv') do |brand|
    Brand.create(name: brand[0])
  end

  CSV.foreach('db/brands/brand_watch.csv') do |brand|
    Brand.create(name: brand[0])
  end

  CSV.foreach('db/brands/brand_cosmetics.csv') do |brand|
    Brand.create(name: brand[0])
  end

  CSV.foreach('db/brands/brand_videogame.csv') do |brand|
    Brand.create(name: brand[0])
  end

  CSV.foreach('db/brands/brand_sports.csv') do |brand|
    Brand.create(name: brand[0])
  end

  CSV.foreach('db/brands/brand_mobile_phone.csv') do |brand|
    Brand.create(name: brand[0])
  end

  CSV.foreach('db/brands/brand_motorcycle.csv') do |brand|
    Brand.create(name: brand[0])
  end

  CSV.foreach('db/brands/brand_instrument.csv') do |brand|
    Brand.create(name: brand[0])
  end

  CSV.foreach('db/brands/brand_car_parts.csv') do |brand|
    Brand.create(name: brand[0])
  end

  CSV.foreach('db/brands/brand_food.csv') do |brand|
    Brand.create(name: brand[0])
  end

  CSV.foreach('db/brands/brand_domestic_car.csv') do |brand|
    Brand.create(name: brand[0])
  end

  CSV.foreach('db/brands/brand_import_car.csv') do |brand|
    Brand.create(name: brand[0])
  end

  # CSV.foreach('db/sizes/category_size.csv') do |row|
  #   CategoriesSize.create(category_id: row[0], size_id: row[1])
  # end

end