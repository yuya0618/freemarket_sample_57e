# 開発環境の時に実行
if Rails.env == "development"
  Image.create!(
    [
      {
        image: File.open("./app/assets/images/スカパラ.jpg"),
        item_id: "1",
      },
      {
        image: File.open("./app/assets/images/ellegarden.jpg"),
        item_id: "2",
      },
      {
        image: File.open("./app/assets/images/FtS0JIaySu25mzo2DK8JMHMoF4MKEBPtjdqoHam6.jpeg"),
        item_id: "3",
      },
      {
        image: File.open("./app/assets/images/fightclub.jpeg"),
        item_id: "4",
      },
    ]
  )
end