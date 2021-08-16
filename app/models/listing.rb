class Listing < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :listings_colours
  has_many :colours, through: :listings_colours
  accepts_nested_attributes_for :listings_colours
end
