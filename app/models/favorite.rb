class Favorite < ApplicationRecord
  #Favoriteモデルのカラム（user_idとpost_image_id）は、
  #UserモデルのidやPostImageモデルのidと関連付けが必要
  belongs_to :user
  belongs_to :post_image
end
