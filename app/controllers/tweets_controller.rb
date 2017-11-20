class TweetsController < ApplicationController
    before_action :authenticate_user!, except: [:index, :show] # user가 로그인 되어있는지 확인하라
    before_action :set_tweet, only: [:show, :edit, :update, :destroy]
  def index
    # @tweets=Tweet.all
    # :id => :desc 를 줄여서 id: :desc
    @tweets = Tweet.order(id: :desc).page params[:page]
  end

  def edit
    set_tweet
  end

  def new
    @tweet=Tweet.new
  end

  def create
    # @tweet.new(
    #   title: params[:tweet][:title],
    #   content: params[:tweet][:content]
    # )
    Tweet.create(
      tweet_params
    )
    redirect_to tweets_path
  end

  def destroy
    set_tweet
    @tweet.destroy
    redirect_to tweets_path
  end

  def show
    set_tweet
  end

  def update
    set_tweet
    @tweet.update(
      tweet_params
    )
    redirect_to tweets_path
  end

  private

  def set_tweet
    @tweet = Tweet.find(params[:id])
  end

  def tweet_params()
    params.require(:tweet).permit(:title,:content,:user_id,:photo_url)
  end
end