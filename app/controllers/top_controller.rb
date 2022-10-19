class TopController < ApplicationController
    def main
        if session[:uid]
            @tweets = Tweet.all
            render top_main_path
        else
            render top_login_path
        end
    end
    
    def login
        user = User.find_by(uid: params[:uid])
        if user
            login_password = BCrypt::Password.new(user.pass)
            if login_password == params[:pass]
                session[:uid] = user.uid
                redirect_to top_main_path
            else
                flash[:info] = "入力情報に誤りがあります"
                render top_login_path
            end
        else
            render top_login_path
        end
    end
    
    def logout
        session.delete(:uid)
        redirect_to top_main_path
    end
end
