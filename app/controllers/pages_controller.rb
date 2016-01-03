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
    render json: Quote.all.order(:id)
  end

  def formatQuote
    quote = params[:quote].split
    if quote.last.include? '-'
      quote[quote.count - 1] = quote[quote.count - 1].gsub('-', "<br><br>-")
    elsif quote[quote.count - 2].include? '-'
      quote[quote.count - 2] = quote[quote.count - 2].gsub('-', "<br><br>-")
    else
      quote[quote.count - 3] = quote[quote.count - 3].gsub('-', "<br><br>-")
    end
   render json: quote.join(' ').html_safe
  end
end
