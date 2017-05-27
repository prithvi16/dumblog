class RelationshipsController < ApplicationController
 before_action :authenticate_user!
 before_action :set_user

  def follow_user



    if current_user.follow @user.id
      respond_to do |format|
        format.html { redirect_to root_url(:subdomain=> @user.user_name) }
        format.js
      end




    end




  end

  def unfollow_user


    if current_user.unfollow @user.id
      respond_to do |format|
        format.html { redirect_to root_url(:subdomain=> @user.user_name) }
        format.js
      end
    end


  end



private

	def set_user
   @user=User.where(subdomain: request.subdomain).first

  if @user.blank?
    flash[:alert]  = "Blog invalid"
    redirect_to root_url(:subdomain=>false)
		end


	end


end
