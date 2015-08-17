class ExperiencesController < ApplicationController
  before_filter :authenticate_user!

  def new
    @user = current_user
    @experience = @user.experiences.new
  end

  def create
    @user = current_user
    @experience = @user.experiences.new(experience_params)

    if @experience.save
      flash[:notice] = "Experience successfully added"
      redirect_to user_experiences_path(@user)
    else
      flash[:errors] = @experience.errors.full_messages.join(', ')
      render :new
    end
  end

  def index
    @user = current_user
    @experiences = @user.experiences.all
  end

  private

  def experience_params
    params.require(:experience).permit(
      :user, :company_name, :company_city, :company_state, :start_date,
      :end_date, :title, :current
    )
  end
end
