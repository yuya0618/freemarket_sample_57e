class Category < ApplicationRecord
  has_many :items
  has_many :categories_sizes
  has_many :sizes, through: :categories_sizes
  belongs_to :parent, class_name: 'Category', optional: true
  has_many :children, class_name: 'Category', foreign_key: 'parent_id'


  self.data = [
    {id: 1, name: 'レディース'},{id: 2, name: 'メンズ'},
    {id: 3, name: 'ベビー・キッズ'},{id: 4, name: 'インテリア・住まい・小物'},
    {id: 5, name: '本・音楽・ゲーム'},{id: 6, name: 'おもちゃ・ホビー・グッズ'},
    {id: 7, name: 'コスメ・香水・美容'},{id: 8, name: '家電・スマホ・カメラ'},
    {id: 9, name: 'スポーツ・レジャー'},{id: 10, name: 'ハンドメイド'},
    {id: 11, name: 'チケット'},{id: 12, name: '自動車・オートバイ'},
    {id: 12, name: 'その他'},
  ]
  end
end
