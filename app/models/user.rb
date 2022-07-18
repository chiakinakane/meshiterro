class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         has_many :post_images, dependent: :destroy#User モデルに PostImage モデルを関連付ける
         
         has_many :post_comments, dependent: :destroy#1:Nの関係（アソシエーション）を、機能として実装。Userモデルに、PostCommentモデルとの1:Nの関係も実装
         has_one_attached :profile_image
         has_many :favorites, dependent: :destroy#いいね機能Userモデルを設定
def get_profile_image(width, height)
  unless profile_image.attached?
    file_path = Rails.root.join('app/assets/images/sample-author1.jpg')
    profile_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
  end
  profile_image.variant(resize_to_limit: [width, height]).processed
end
         
end
