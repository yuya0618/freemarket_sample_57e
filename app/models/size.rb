class Size < ActiveHash::Base
  include ActiveHash::Associations
  has_many :items
  has_many :categories_sizes
  has_many :categories, through: :categories_sizes

  self.data = [
    {id: '', name: '---'},

    # 洋服全般

    {id: 1, name: 'XXS以下'}, {id: 2, name: 'XS(SS)'},
    {id: 3, name: 'S'},{id: 4, name: 'M'},
    {id: 5, name: 'L'}, {id: 6, name: 'XL(LL)'},
    {id: 7, name: '2XL(sL)'}, {id: 8, name: '3XL(4L)'},
    {id: 9, name: '4XL(5L以上)'},{id: 10, name: 'FREE SIZE'},



    {id: 11, name: 'XSサイズ以下'}, {id: 12, name: 'Sサイズ'},
    {id: 13, name: 'Mサイズ'}, {id: 14, name: 'Lサイズ'},
    {id: 15, name: 'XLサイズ'},{id: 16, name: 'XXLサイズ'},
    {id: 17, name: 'フリーサイズ'}, {id: 18, name: '子ども用'},


    # 靴（女性）

    {id: 19, name: '20cm以下'}, {id: 20, name: '20.5cm'},
    {id: 21, name: '21cm'},{id: 22, name: '21.5cm'},
    {id: 23, name: '22cm'}, {id: 24, name: '22.5cm'},
    {id: 25, name: '23cm'}, {id: 26, name: '23.5cm'},
    {id: 27, name: '24cm'},{id: 28, name: '24.5cm'},
    {id: 29, name: '25cm'}, {id: 30, name: '25.5cm'},
    {id: 31, name: '26cm'}, {id: 32, name: '26.5cm'},
    {id: 33, name: '27cm'},{id: 34, name: '27.5cm以上'},


    # 靴（男性）
    {id: 35, name: '23.5cm以下'}, {id: 36, name: '24cm'},
    {id: 37, name: '24.5cm'}, {id: 38, name: '25cm'},
    {id: 39, name: '25.5cm'},{id: 40, name: '26cm'},
    {id: 41, name: '26.5cm'}, {id: 42, name: '27cm'},
    {id: 43, name: '27.5cm'}, {id: 44, name: '28cm'},
    {id: 45, name: '28.5cm'},{id: 46, name: '29cm'},
    {id: 47, name: '29.5cm'}, {id: 48, name: '30cm'},
    {id: 49, name: '30.5cm'}, {id: 50, name: '31cm以上'},


    # 子ども衣類（95cmまで)

    {id: 51, name: '60cm'}, {id: 52, name: '70cm'},
    {id: 53, name: '80cm'}, {id: 54, name: '90cm'},
    {id: 55, name: '95cm'},

    # 子ども衣類（100cm以上)

    {id: 56, name: '100cm'}, {id: 57, name: '110cm'},
    {id: 58, name: '120cm'}, {id: 59, name: '130cm'},
    {id: 60, name: '140cm'},{id: 61, name: '150cm'},
    {id: 62, name: '160cm'},


    # 靴（子ども）
    {id: 63, name: '10.5cm以下'}, {id: 64, name: '11cm・11.5cm'},
    {id: 65, name: '12cm・12.5cm'},{id: 66, name: '13cm・13.5cm'},
    {id: 67, name: '14cm・14.5cm'}, {id: 68, name: '15cm・15.5cm'},
    {id: 69, name: '16cm・16.5cm'}, {id: 70, name: '17cm以上'},

    # テレビ

    {id: 71, name: '~20インチ'}, {id: 72, name: '20~26インチ'},
    {id: 73, name: '26~32インチ'}, {id: 74, name: '32~37インチ'},
    {id: 75, name: '37~40インチ'},{id: 76, name: '40~42インチ'},
    {id: 77, name: '42~46インチ'}, {id: 78, name: '46~52インチ'},
    {id: 79, name: '52~60インチ'}, {id: 80, name: '60インチ~'},


    # タイヤ

    {id: 94, name: '12インチ'},{id: 95, name: '13インチ'},
    {id: 96, name: '14インチ'}, {id: 97, name: '15インチ'},
    {id: 98, name: '16インチ'}, {id: 99, name: '17インチ'},
    {id: 100, name: '18インチ'},{id: 101, name: '19インチ'},
    {id: 102, name: '20インチ'}, {id: 103, name: '21インチ'},
    {id: 104, name: '22インチ'}, {id: 105, name: '23インチ'},
    {id: 106, name: '24インチ'},



    # 車

    {id: 81, name: '50cc以下'}, {id: 82, name: '51cc-125cc'},
    {id: 83, name: '126cc-250cc'}, {id: 84, name: '251cc-400cc'},
    {id: 85, name: '401cc-750cc'},{id: 86, name: '751cc以上'},


    # スキー板

    {id: 87, name: '140cm~'}, {id: 88, name: '150cm~'},
    {id: 89, name: '160cm~'}, {id: 90, name: '170cm~'},
    {id: 91, name: 'スキーボード'}, {id: 92, name: '子ども用'},
    {id: 93, name: 'その他'},


    # カメラ（レンズ）

    {id: 107, name: 'ニコンFマウント'},{id: 108, name: 'キャノンEFマウント'},
    {id: 109, name: 'ペンタックスKマウント'},{id: 110, name: 'ペンタックスQマウント'},
    {id: 111, name: 'フォーサーズマウント'},{id: 112, name: 'マイクロフォーサーズマウント'},
    {id: 113, name: 'a Aマウント'},{id: 114, name: 'a Eマウント'},
    {id: 115, name: 'ニコン１マウント'},{id: 116, name: 'キャノンEF-Mマウント'},
    {id: 117, name: 'Xマウント'},{id: 118, name: 'シグマSAマウント'},

    # スノーボード

    {id: 119, name: '135cm-140cm未満'},{id: 120, name: '140cm-145cm未満'},
    {id: 121, name: '145cm-150cm未満'},{id: 122, name: '150cm-155cm未満'},
    {id: 123, name: '155cm-160cm未満'},{id: 124, name: '160cm-165cm未満'},
    {id: 125, name: '165cm-170cm未満'},



]

end
