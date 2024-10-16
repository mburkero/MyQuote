class UsersController < ApplicationController
  before_action :set_user, only: %i[ show edit update destroy ]
  before_action :require_login, except: [:new, :create]

  # GET /users or /users.json
  def index
    # only accessible to administrators
    if logged_in? && is_administrator? #logged in as an admin user
      @users = User.all #retrieve all users
    elsif logged_in? && !is_administrator? #logged in but not an admin user
      redirect_to userhome_path #redirect them to their landing page
    else #if not logged in
      flash[:error] = "You are not authorised to access this resource."
      redirect_to login_path
    end
  end

  # GET /users/1 or /users/1.json
  def show
    if logged_in? #if there is an active session
      if current_user.id == @user.id || is_administrator? #if current user is the target user or an admin, grant access (by doing nothing).
      else #if current user is not the target user, deny access and return to launch page
        flash[:error] = "You are not authorised to access this resource"
      redirect_to userhome_path
      end
    else #if there is not an active session
      flash[:error] = "you are not authorised to access this resource"
      redirect_to login_path
    end
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
    if logged_in? #if there is an active session
      if current_user.id == @user.id || is_administrator? #if current user is the target user or an admin, grant access (by doing nothing).
      else #if current user is not the target user, deny access and return to launch page
        flash[:error] = "You are not authorised to access this resource"
      redirect_to userhome_path
      end
    else #if there is not an active session
      flash[:error] = "you are not authorised to access this resource"
      redirect_to login_path
    end
  end

  # POST /users or /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        #format.html { redirect_to user_url(@user), notice: "User was successfully created." }
        format.html { redirect_to login_path, notice: "Sign up successful. Please log in."}
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1 or /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to user_url(@user), notice: "User was successfully updated." }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1 or /users/1.json
  def destroy
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url, notice: "User was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:fname, :lname, :email, :password, :isAdmin, :status)
    end
end
