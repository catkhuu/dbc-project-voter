class AdminsController < ApplicationController
  before_action :logged_in_user, :authorize

  def show
    @pitches = Pitch.all
    @cohorts = Cohort.all
    render :show
  end

  private

    def set_admin
      @admin = User.find_by(id: params[:id])
    end

    def authorize
      render 'error_404' unless current_user.admin?
    end
end
