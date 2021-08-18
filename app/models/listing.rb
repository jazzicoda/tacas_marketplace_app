class Listing < ApplicationRecord
  belongs_to :user
  belongs_to :category
  belongs_to :colour
  has_many :listings_colours , class_name: "ListingsColour"
  has_many :colours, through: :listings_colours, class_name: "Colour"
  accepts_nested_attributes_for :listings_colours
end
