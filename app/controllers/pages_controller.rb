class PagesController < ApplicationController

  def index
    @quotes = Quote.all
  end
  
end
