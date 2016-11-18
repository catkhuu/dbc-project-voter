class UsersController < ApplicationController
  # before_filter :sanitize_user_params, only: [:create, :edit, :update]
  before_action :logged_in_user, :find_and_ensure_user, only: [:show, :edit, :update]
  before_action :correct_user, only: [:show, :edit, :update]

  def show
    # User.all[2] was just to check that page was working
    # really should be:
    # @user = User.find(params[:user_id])
    @user = User.all[3]
    if @user.admin == true
      # render admin dashboard
      # render 'show_admin'
    else
      # render user dashboard
      rounds = @user.rounds.distinct
      @first_round = rounds.select { |round| round.name == "first" }[0]
      @second_round = rounds.select { |round| round.name == "second" }[0]
      @final_round = rounds.select { |round| round.name == "final" }[0]

      @pitches = []
      Pitch.all.each do |pitch|
        @pitches << pitch if pitch.user.cohort == @user.cohort
      end
      render 'show_student'
    end
  end

  def new
    @cohorts = Cohort.order(:name)
  end

  def create
    @cohorts = Cohort.order(:name)
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      flash[:success] = 'Thank you for creating an account!'
      # protected(user) # this will redirect to either user show page or admin page
      redirect_to '/'
    else
      @errors = user.errors.full_messages
      render 'new'
    end
  end

  def edit
  end

  def update
    if @user.update_attributes(user_params)
      flash[:success] = 'Profile updated'
      redirect_to @user
    else
      @errors = @user.errors.full_messages
      render 'edit'
    end
  end

  private

    def user_params
      params.require(:user).permit(:name, :username, :email, :cohort_id, :password, :password_confirmation)
    end

    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = 'Please log in'
        redirect_to signin_url
      end
    end

    def admin?
      !!current_user.admin
    end

    def protected(user)
      redirect_to user_path unless user.admin?
      redirect_to admin_path(user) # or to whatever the admin show page path
    end

    def find_and_ensure_user
      @user = User.find_by(id: session[:user_id])
    end

    def correct_user
      user = User.find_by(id: params[:id])
      redirect_to(root_url) unless current_user?(user)
    end
end
