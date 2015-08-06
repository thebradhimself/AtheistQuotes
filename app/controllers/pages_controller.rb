class PagesController < ApplicationController

  def index
    @quotes = Quote.all
  end

  def author
    @authors = Quote.all
  end

end
