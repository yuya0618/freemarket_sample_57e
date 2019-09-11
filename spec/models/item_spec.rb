# require 'rails_helper'

# describe "TOPページ表示機能" do
#   before do
#     # ユーザAを作成
#     @user_a = build(:user, nickname: "ユーザA")
#   end
#   context "親カテゴリーがレディースの時" do
#     before do
#       # itemの親カテゴリーがレディース&ユーザAの投稿を用意する
#       @category = build(:category, name:"レディース")
#       @brand = build(:brand, name:"ナイキ")
#       @item_women = build(:item, name: "レディースアイテム", category_id: "@category.id", user: @user_a)
#       # item_womenのimageを作成する
#       build(:image, item: @item_women)
#     end
#     it "レディースboxに表示する" do
#       # レディースの所に表示されていることを確認
#       expect(page).to has_content @item_women
#     end
#   end
# end