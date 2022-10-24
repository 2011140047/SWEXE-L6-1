class LikesController < ApplicationController
    def create
        tweet = Tweet.find(params[:tweet_id])
        current_user = User.find_by(uid: session[:uid])
        #user = User.find_by(uid: session[:uid])
        #user.like_tweets << tweet
        unless tweet.liked?(current_user)
            tweet.like(current_user)
        end
        redirect_to top_main_path
    end
    
    def destroy
        tweet = Tweet.find(params[:id])
        current_user = User.find_by(uid: session[:uid])
        #user = User.find_by(uid: session[:uid])
        #tweet.likes.find_by(user_id: user.id).destroy
        if tweet.liked?(current_user)
            tweet.unlike(current_user)
        end
        redirect_to top_main_path
    end
end
