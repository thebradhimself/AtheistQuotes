class PagesController < ApplicationController

  def index
    @quotes = Quote.all
  end

  def app
  end
  
end
