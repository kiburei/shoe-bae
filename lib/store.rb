class Store < ActiveRecord::Base
  validates(:name, :presence => true)

  has_many :shoes
  has_many :brands, through: :shoes
end
