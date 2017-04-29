class PersonController < ApplicationController

    def show
        @user=User.find_by user_name: params[:user]
        @posts=@user.posts
    end
end
