class Colour < ApplicationRecord
    has_many :listings_colours , class_name: "ListingsColour"
    has_many :colours, through: :listings_colours, class_name: "Colour"
end
