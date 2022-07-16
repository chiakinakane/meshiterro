class CreatePostImages < ActiveRecord::Migration[6.1]
  def change
      create_table :post_images do |t|#カラム名の設定
      t.string :shop_name
      t.text :caption
      t.integer :user_id
      t.timestamps
    end
  end
end
