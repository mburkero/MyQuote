class SearchController < ApplicationController
  def index
    # query returns all quotes that are linked to a searched category so long as they are marked as public. Frontend implementation is found in app/views/search/index.html.erb
    category_query = params[:category_query]
      if category_query.present?
        @quote_match = Quote.joins(:author, :quote_categories, :categories).where("quotes.isQuotePublic = true AND categories.categoryName LIKE ?", "%#{category_query}%").distinct
      end
  end
end
