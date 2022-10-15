class TopController < ApplicationController
    def main
        render "login"
    end
    def login
        user = User.find_by(uid: params[:uid])
        login_password = BCrypt::Password.new(user.pass)
        if login_password == params[:pass]
            session[:login_uid] = params[:uid]
            p "ログイン成功"
            redirect_to root_path
        else
            render 'error'
        end
    end
    def logout
        session.delete(:login_uid)
        redirect_to root_path
    end
end
