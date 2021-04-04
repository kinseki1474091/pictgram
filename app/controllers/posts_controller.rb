class PostsController < ApplicationController
  
  def change
    drop_table :rocords
  end
  
  #ユーザーのログイン状態を確かめる。indexはログインしてなくても閲覧可能にしてます。
  before_action :authenticate_user!, only: [:show, :create]
  
  def index
    @posts=current_user.posts.all #投稿一覧を表示させるために全取得
    @post=current_user.posts.new #投稿一覧画面で新規投稿を行うので、formのパラメータ用にPostオブジェクトを取得
  end

  def show
    @post=Post.find(params[:id])
    @comments=@post.comments #投稿詳細に関連付けてあるコメントを全取得
    @comment=current_user.comments.new #投稿詳細画面でコメントの投稿を行うので、formのパラメータ用にCommentオブジェクトを取得
  end
  
  def create
    @post=current_user.posts.new(post_params)
    if @post.save
      redirect_back(fallback_location: root_path) #コメント送信後は、一つ前のページへリダイレクトさせる。
    else
      redirect_back(fallback_location: root_path)
    end
  end
  
  private
  def post_params
    params.require(:post).permit(:post_content)
  end
  
end
