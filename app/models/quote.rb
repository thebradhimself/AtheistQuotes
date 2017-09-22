class Quote < ActiveRecord::Base
  #acts_as_copy_target
  has_many :quote_favorites
  has_many :users, through: :quotes_favorites
  serialize :quotes, Hash
end
