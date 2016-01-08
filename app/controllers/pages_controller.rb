class PagesController < ApplicationController

  def index
    @quotes = Quote.all
  end

  def app
  end

  def allquotes
    @quotes = Quote.all.order(:id)
  end

  def getQuotes
    favorites = []
    if current_user
      favorites = current_user.quotefavorites
    end
    render json: {quotes: Quote.all.order(:id), favorites: favorites, user: current_user.present?}
  end

  def favoriting
    checked = true;
    if current_user.quotefavorites.pluck(:quote_id).include?(params[:id].to_i)
      Quotefavorite.where(quote_id: params[:id]).first.destroy
      checked = false
    else
      Quotefavorite.create(user_id: current_user.id, quote_id: params[:id])
      checked = true
    end
    render json: {checked: checked}
  end

  def check_favorite
    checked = current_user.quotefavorites.pluck(:quote_id).include?(params[:id].to_i)
    render json: {checked: checked}
  end

end
