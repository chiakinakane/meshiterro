class PostImage < ApplicationRecord
  has_one_attached :image#モデルに image を持たせる
  belongs_to :user #PostImage モデルに User モデルを関連付ける
  
 def get_image#画像が投稿されていない場合はエラーが出るのを回避するため
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image
  end
end
