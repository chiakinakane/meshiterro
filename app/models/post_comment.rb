class PostComment < ApplicationRecord
  belongs_to :user
  belongs_to :post_image
  has_many :favorites, dependent: :destroy#いいね機能用
  
  def favorited_by?(user)#favorited_by?メソッドを作成.引数で渡されたユーザidがFavoritesテーブル内に存在（exists?）するかどうかを調べます。 存在していればtrue、存在していなければfalseを返すようにしています。
#これは、後述するViewの作成で利用します。
    favorites.exists?(user_id: user.id)
  end
end
