class ExperiencesController < ApplicationController
  before_filter :authenticate_user!

  def new
    @user = current_user
    @experience = @user.experiences.new
  end
end
