class HomeController < ApplicationController
  def index
    # queries the database for the 5 most recent PUBLIC quotes, along with their respective category "Recent Added Quotes" feature.
    @quotes = Quote.includes(:user, :author, :categories)
                   .select("users.fname, authors.*, quote_categories.*, quotes.*, categories.*")
                   .where(isQuotePublic: true)
                   .references(:user, :author, :categories)
                   .order(created_at: :desc)
                   .take(5)
  end
  def uquotes
    #get all quotes, along with their author and related categories for the currently logged in user
    @quotes = Quote.includes(:user, :author, :categories)
                   .select("users.fname, authors.*, quote_categories.*, quotes.*, categories.*")
                   .where(user_id: session[:user_id])
                   .references(:user, :author, :categories)
  end
end
