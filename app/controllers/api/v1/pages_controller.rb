module Api
  module V1
    class PagesController < ApplicationController

      def getQuotes
        favorites = []
        if current_user
          favorites = current_user.quotefavorites
        end
        render json: {quotes: Quote.all.order(:id), favorites: favorites, user: current_user.present?}
      end
      
    end
  end
end
