class PostImagesController < ApplicationController
  def new
   @post_image = PostImage.new
  end
  
  def create#バリデーション用
    @post_image = PostImage.new(post_image_params)
    @post_image.user_id = current_user.id
    if @post_image.save
      redirect_to post_images_path
    else
      render :new
    end
  end
  
  
  #def create バリデーション無し
    #@post_image = PostImage.new(post_image_params)
    #@post_image.user_id = current_user.id
    #@post_image.save
    #redirect_to post_images_path
  #end

  def index
    @post_images = PostImage.page(params[:page])#1ページ分の決められた数のデータだけを、新しい順に取得するように変更
  end

  #def index
    #@post_images = PostImage.all
  #end

  def show
    @post_image = PostImage.find(params[:id])
    @post_comment = PostComment.new#コメントを投稿するためのインスタンス変数を定義
  end
  
  def destroy
    @post_image = PostImage.find(params[:id]) 
    @post_image.destroy
    redirect_to '/post_images'
  end
  
  
  # 投稿データのストロングパラメータ
  private

  def post_image_params
    params.require(:post_image).permit(:shop_name, :image, :caption)
  end
end
