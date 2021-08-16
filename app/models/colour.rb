class Colour < ApplicationRecord
    has_many :listings_colours
    has_many :listings, through: :listings_colours
end
