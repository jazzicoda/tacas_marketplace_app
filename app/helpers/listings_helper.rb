module ListingsHelper
    def image_select(listing)
        return listing.picture if listing.picture.attached?
        #if no image is loaded, use default image:
        return "default-image.png"
    end 
end
