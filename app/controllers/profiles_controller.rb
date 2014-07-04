class ProfilesController < ApplicationController
  def new
    @user = User.find(params[:id])
    @profile = Profile.new
  end

  def create
  end
end
