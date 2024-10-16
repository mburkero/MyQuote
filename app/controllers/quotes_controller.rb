class QuotesController < ApplicationController
  before_action :set_quote, only: %i[ show edit update destroy ]
  before_action :require_login, except: [ :show]

  # GET /quotes or /quotes.json
  def index
    @quotes = current_user.quotes
  end

  # GET /quotes/1 or /quotes/1.json
  def show
    if logged_in? #if there is an active session
      if current_user.id == @quote.user_id #if current user is the uploader, grant access (by doing nothing).
      else #if current user is not the uploader, deny access and return to launch page
        flash[:error] = "You are not authorised to access this resource"
        redirect_to userhome_path
      end
    else #if there is not an active session
      flash[:error] = "you are not authorised to access this resource"
      redirect_to login_path
    end
  end

  # GET /quotes/new
  def new
    @quote = Quote.new
    8.times {@quote.quote_categories.build} #builds 8 quote category fields
  end

  # GET /quotes/1/edit
  def edit
    if logged_in? #if there is an active session
      if current_user.id == @quote.user_id #if current user is the uploader, grant access (by doing nothing).
      else #if current user is not the uploader, deny access and return to launch page
        flash[:error] = "You are not authorised to access this resource"
        redirect_to userhome_path
      end
    else #if there is not an active session
      flash[:error] = "you are not authorised to access this resource"
      redirect_to login_path
    end
  end

  # POST /quotes or /quotes.json
  def create
    @quote = Quote.new(quote_params)

    respond_to do |format|
      if @quote.save
        format.html { redirect_to quote_url(@quote), notice: "Quote was successfully created." }
        format.json { render :show, status: :created, location: @quote }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @quote.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /quotes/1 or /quotes/1.json
  def update
    respond_to do |format|
      if @quote.update(quote_params)
        format.html { redirect_to quote_url(@quote), notice: "Quote was successfully updated." }
        format.json { render :show, status: :ok, location: @quote }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @quote.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /quotes/1 or /quotes/1.json
  def destroy
    @quote.destroy

    respond_to do |format|
      format.html { redirect_to quotes_url, notice: "Quote was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_quote
      @quote = Quote.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def quote_params
      params.require(:quote).permit(:quoteText, :yearOfPublication, :comment, :isQuotePublic, :user_id, :author_id, quote_categories_attributes: [:id, :category_id])
    end
end
