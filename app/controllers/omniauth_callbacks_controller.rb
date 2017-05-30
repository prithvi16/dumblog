class OmniauthCallbacksController < Devise::OmniauthCallbacksController


def github


puts "hello"
user = User.find_by( email: request.env["omniauth.auth"].info.email)


if !user.nil?
      sign_in_and_redirect user #this will throw if @user is not activated
      set_flash_message(:notice, :success, :kind => "Github") if is_navigational_format?
    else
      session["devise.github_data"] = request.env["omniauth.auth"]
      redirect_to new_user_registration_url
      flash[:alert]="create a new account please"

    end





end






end
