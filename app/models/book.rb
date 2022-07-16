class Book < ApplicationRecord
   has_one_attached :image#イメージ画像を表示するための記入。アクティブストレージと繋がってる。
end
