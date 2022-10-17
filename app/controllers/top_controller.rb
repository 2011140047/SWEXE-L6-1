class TopController < ApplicationController
    def main
        if session[:login_uid] && session[:login_pass]
            @tweets = Tweet.all
            render top_main_path
        else
            render top_login_path
        end
    end
    
    def login
        login_password = BCrypt::Password.create(params[:pass])
        if login_password == params[:pass]
            session[:login_uid] = params[:uid]
            session[:login_pass] = params[:pass]
            p "ログイン成功"
            redirect_to top_main_path
        else
            render top_login_path
        end
    end
    
    def logout
        session.delete(:login_uid)
        session.delete(:login_pass)
        redirect_to root_path
    end
end
