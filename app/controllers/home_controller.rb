class HomeController < ApplicationController
  def index
    # queries the database for the 5 most recent PUBLIC quotes, along with their respective category "Recent Added Quotes" feature.
    @quotes = Quote.includes(:author, :categories).where(isQuotePublic: true).order(created_at: :desc).take(5)
  end
end
