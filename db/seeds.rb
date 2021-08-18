# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

categories = [
    {name: "Accessories", description: "Scarves, Belts, Wallets, "},
    {name: "Art Works", description: "Original artworks by our local artists"},
    {name: "Cards", description: "Gift cards, xmas cards, birthday cards"},
    {name: "Clothing", description: "Beautiful, unique and ethical clothing for your bod."},
    {name: "Homewares", description: "Hand crafted delights for your home"},
    {name: "Jewellery", description: "Hand crafted jewellery"},
    {name: "Mosaics", description: "Broken ceramics find new life"},
    {name: "Outerwear", description: "Jackets, Coats and Vests"},
    {name: "Textiles", description: "Fabrics and fibres are transformed into works of art"},
]

colours = ["Black", "Blue", "Brown", "Green", "Grey", "Orange", "Purple", "Red", "Teal"]


if Category.count == 0
    categories.each do |category|
        Category.create(name: category[:name], description: category[:description])
        puts "created #{category[:name]} category"
    end
end

if Colour.count == 0
    colours.each do |colour|
        Colour.create(name: colour)
        puts "created #{colour} colour"
    end
end

#check if this is working
if User.count == 0
    User.create(username: "Tester",email: "test@test.com", password: "password",password_confirmation: "")
end