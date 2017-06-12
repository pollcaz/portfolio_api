class ProfilesController < ApplicationController
  before_action :find_profile, except: [:index]

  def index
    @profiles = Profile.find_by(user_id: current_user.id)
  end

  def update
    if @profile.update(profile_params)
      redirect_to profiles_path, notice: 'Profile updated successfully!'
    else
      flash[:alert] = @profile.errors.full_messages
      render :edit
    end
  end

  private

  def find_profile
    @profile = Profile.find(params[:id])
  end

  def profile_params
    params.require(:profile).permit(:user_name, :image_link, :description, :twitter_account)
  end
end
