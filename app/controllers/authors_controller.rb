class AuthorsController < ApplicationController
  before_action :set_author, only: %i[ show edit update destroy ]
  before_action :require_login

  # GET /authors or /authors.json
  def index
    @authors = Author.all
  end

  # GET /authors/1 or /authors/1.json
  def show
    if logged_in? #if there is an active session
      if is_administrator? #if current user is an admin, grant access (by doing nothing).
      else #if current user is not admin, deny access and return to launch page
        flash[:error] = "You are not authorised to access this resource"
      redirect_to userhome_path
      end
    else #if there is not an active session, return to login page
      flash[:error] = "you are not authorised to access this resource"
      redirect_to login_path
    end
  end

  # GET /authors/new
  def new
    @author = Author.new
  end

  # GET /authors/1/edit
  def edit
    if logged_in? #if there is an active session
      if is_administrator? #if current user is an admin, grant access (by doing nothing).
      else #if current user is not admin, deny access and return to launch page
        flash[:error] = "You are not authorised to access this resource"
      redirect_to userhome_path
      end
    else #if there is not an active session, return to login page
      flash[:error] = "you are not authorised to access this resource"
      redirect_to login_path
    end
  end

  # POST /authors or /authors.json
  def create
    @author = Author.new(author_params)

    respond_to do |format|
      if @author.save
        format.html { redirect_to author_url(@author), notice: "Author was successfully created." }
        format.json { render :show, status: :created, location: @author }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @author.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /authors/1 or /authors/1.json
  def update
    respond_to do |format|
      if @author.update(author_params)
        format.html { redirect_to author_url(@author), notice: "Author was successfully updated." }
        format.json { render :show, status: :ok, location: @author }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @author.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /authors/1 or /authors/1.json
  def destroy
    @author.destroy

    respond_to do |format|
      format.html { redirect_to authors_url, notice: "Author was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_author
      @author = Author.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def author_params
      params.require(:author).permit(:authName, :authByear, :authDyear, :biography)
    end
end
