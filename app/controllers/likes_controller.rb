class LikesController < ApplicationController
    def create
        tweet = Tweet.find(params[:tweet_id])
        user = User.find_by(uid: session[:uid])
        logger.debug tweet
        logger.debug "|" + session[:uid].to_s + "|"
        user.like_tweets << tweet
        redirect_to top_main_path
    end
    def destroy
        tweet = Tweet.find(params[:id])
        user = User.find_by(uid: session[:uid])
        tweet.likes.find_by(user_id: user.id).destroy
        redirect_to top_main_path
    end
end
