class PagesController < ApplicationController
  access all: [:index, :authors, :author], admin: :all, user: [:favoriting, :favorites]

  def index
    @quotes = Quote.all
    @favorites = current_user.quote_favorites.pluck(:quote_id) if current_user
  end

  def buffer_it
    quote = Quote.find(params[:id])
    client = Buffer::Client.new(ENV["buffer_access"])
    client.delay.create_update(
      body: {
        text:
          "#{quote.quote}\n\n#{quote.author}",
      profile_ids: ["#{ENV['buffer_twitter']}", "#{ENV['buffer_fb_god']}", "#{ENV['buffer_fb_aq']}"]
      },
    )
    respond_to do |format|
      format.js
      format.html { redirect_to root_path }
    end
  end
  
  def update
    quote = Quote.find(params[:id])
    quote.update(quote: params[:quote], author: params[:author])
    render json: {quote: quote}, status: 200
  end

  def author
    @quotes = Quote.where(author: params[:author]).page(params[:page])
    @favorites = current_user.quote_favorites.pluck(:quote_id) if current_user
  end

  def authors
    @authors = Quote.all.order(:author).pluck(:author).uniq
  end

end
