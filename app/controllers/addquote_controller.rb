class AddquoteController < ApplicationController

  def index
    @quote = AddQuote.new
  end

  def show
    @quotes = Quote.all.order(:id)
  end

  def quotes_added
    @quotes = AddQuote.all
  end

  def new
    @quote = AddQuote.new
  end

  def create
    @quote = AddQuote.create(quote_params)
    redirect_to root_path
  end

  private
  def quote_params
    params.require(:add_quote).permit(:quote, :author)
  end

end
