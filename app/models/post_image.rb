class PostImage < ApplicationRecord
  
  belongs_to :user#PostImage モデルに User モデルを関連付ける
  has_one_attached :image#モデルに image を持たせる
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  
  validates :shop_name, presence: true
  validates :image, presence: true
  

  
  def get_image#画像が投稿されていない場合はエラーが出るのを回避するため
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image
  end
  
  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end
  
end
