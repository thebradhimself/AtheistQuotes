class Quote < ActiveRecord::Base
  #acts_as_copy_target
  has_many :quotefavorites
  has_many :users, through: :quotesfavorites
end
