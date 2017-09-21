class PagesController < ApplicationController
  access all: [:index, :authors, :author], admin: :all, user: [:favoriting, :favorites]

  def index
    @quotes = Quote.all.order(:id).page(params[:page])
    @favorites = current_user.quotefavorites.pluck(:quote_id) if current_user

  end

  def buffer_it
    quote = Quote.find(params[:id])
    client = Buffer::Client.new(ENV["buffer_access"])
    client.create_update(
      body: {
        text:
          "#{quote.quote}
           #{quote.author}",
      profile_ids: ENV["buffer_ids"] 
      },
    )
    redirect_to(request.env['HTTP_REFERER'])
  end

  def app
  end

  def admin
    @quotes = AddQuote.all
  end

  def allquotes
    @quotes = Quote.all.order(:id).page(params[:page])
  end

  def update
    quote = Quote.find(params[:id])
    quote.update(quote: params[:quote], author: params[:author])
    render json: {quote: quote}, status: 200
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
      Quotefavorite.where(quote_id: params[:id], user_id: current_user.id).first.destroy
      checked = false
    else
      Quotefavorite.create(user_id: current_user.id, quote_id: params[:id])
      checked = true
    end
    render json: {checked: checked}
  end

  def favorites
    @favs = current_user.quotefavorites
  end

  def check_favorite
    checked = current_user.quotefavorites.pluck(:quote_id).include?(params[:id].to_i)
    render json: {checked: checked}
  end

  def getFavoriteQuote
    render json: {quote: Quote.find(params[:id])}
  end

  def removeFavorite
    Quotefavorite.where(quote_id: params[:id], user_id: current_user.id).first.destroy
    render json: {favorites: current_user.quotefavorites}
  end

  def crpass
  end

  def author
    @quotes = Quote.where(author: params[:author]).page(params[:page])
  end

  def authors
    @authors = Quote.all.order(:author).pluck(:author).uniq
  end

end
