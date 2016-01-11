class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  skip_before_filter :require_user, :only => [:create, :new, :show]

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    if @user.save
      flash[:success] = 'User was successfully created.'
      redirect_to root_url
    else
      flash[:danger] = 'Whoops, that didn\'t work!'
      render 'new'
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    if @user.update(user_params)
      flash[:success] = 'User was successfully updated.'
      redirect_to root_url
    else
      flash[:danger] = 'Whoops, that didn\'t work!'
      render 'edit'
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password,
                                   :photo_url, :facebook, :twitter, :website)
    end
end
