class Shoe < ActiveRecord::Base
  belongs_to :store
  belongs_to :brand
end
