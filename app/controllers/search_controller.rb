class SearchController < ApplicationController
  def index
    # query returns all quotes that are linked to a searched category so long as they are marked as public. Frontend implementation is found in app/views/search/index.html.erb
    category_query = params[:category_query]
      if category_query.present?
        @quote_match = Quote.includes(:user, :author, :categories)
                            .select("users.fname, authors.*, quotes.*, categories.*")              
                            .where("quotes.isQuotePublic = true AND categories.categoryName LIKE ?", "%#{category_query}%")
                            .references(:user, :author, :categories)
                            .distinct
      end
  end
end
