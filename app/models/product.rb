class Product < ApplicationRecord
  has_many :baskets
  has_many :clients, :through => :baskets
end
