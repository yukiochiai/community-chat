class TweetsController < ApplicationController

  def index
    @tweets = Tweet.includes(:user)
  end

  def guest
    user = User.find_or_create_by(email: 'guest@example.com') do |user|
    user.password = SecureRandom.urlsafe_base64
    user.nickname = "ゲストユーザー"
    end
    sign_in user
    redirect_to root_path, notice: 'ゲストユーザーとしてログインしました。'
  end

  def new
    @tweet = Tweet.new
  end
  
  def create
    @tweet = Tweet.new(tweet_params)
    @tweet.user.id = current_user.id
    if @tweet.save
      redirect_to root_path(@tweet), notice: '投稿に成功しました'
    else 
      flash.now[:alert] = 'タイトルとブログ本文を両方入力してください'
      render :new
    end
  end

  def show
    @tweet = Tweet.find(params[:id])
    @comment = Comment.new
    @comments = @tweet.comments.includes(:user)
  end

  def search
    @tweets = Tweet.search(params[:keyword])
  end

  def edit
    @tweet = Tweet.find(params[:id])
  end
  
  def update
    tweet = Tweet.find(params[:id])
    tweet.update(tweet_params)
    redirect_to tweet_path(tweet.id), notice: '編集されました'
  end

  def destroy
    tweet = Tweet.find(params[:id])
    tweet.destroy
    redirect_to root_path(@tweet), notice: '削除されました'
  end
  private
  def tweet_params
    params.require(:tweet).permit(:title, :content).merge(user_id: current_user.id)
  end
end

