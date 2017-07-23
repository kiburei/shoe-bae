class Brand < ActiveRecord::Base
  validates(:name, :presence => true )
  has_many :shoes
  has_many :stores, through: :shoes

end
