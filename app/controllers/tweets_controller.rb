class TweetsController < ApplicationController
  def index
    @tweets = Tweet.all
  end

  def new
    @tweet = Tweet.new
  end

  def create
    tweet = Tweet.new(message: params[:tweet][:message], tdate: Time.current)
    if tweet.save
      flash[:notice] = '1レコード追加しました'
      redirect_to tweets_path
    else
      render tweets_new_path
    end
  end

  def destroy
    tweet = Tweet.find(params[:id])
    tweet.destroy
    redirect_to tweets_path
  end
end
