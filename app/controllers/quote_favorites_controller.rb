class QuoteFavoritesController < ApplicationController
  access admin: :all, user: [:favoriting, :favorites]

  def index
    @quotes = Quote.all
    @favorites = current_user.quotes.pluck(:id) if current_user
  end

  def favoriting
    checked = true;
    quote_id = params[:id].to_i
    user_id = current_user.id
    if current_user.quote_favorites.pluck(:quote_id).include?(quote_id)
      QuoteFavorite.where(quote_id: quote_id, user_id: user_id).first.destroy
      checked = false
    else
      QuoteFavorite.create(user_id: user_id, quote_id: quote_id)
      checked = true
    end
    render json: {checked: checked}
  end

  def favorites
    @favs = current_user.quotes
    @favorites = @favs.pluck(:id)
  end

  # def check_favorite
  #   checked = current_user.quote_favorites.pluck(:quote_id).include?(params[:id].to_i)
  #   render json: {checked: checked}
  # end
  #
  # def getFavoriteQuote
  #   render json: {quote: Quote.find(params[:id])}
  # end
  #
  # def removeFavorite
  #   QuoteFavorite.where(quote_id: params[:id], user_id: current_user.id).first.destroy
  #   render json: {favorites: current_user.quote_favorites}
  # end
end 
