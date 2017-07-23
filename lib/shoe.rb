class Shoe < ActiveRecord::Base
  validates(:label, :size, :color, :store_id, :brand_id, :presence => true)

  belongs_to :store
  belongs_to :brand
end
