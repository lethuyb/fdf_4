Categories.create categoryName: "Food"
Categories.create categoryName: "Drink"
20.times do |n|
  Product.create! price:  (n+1),
    productName: "Che Tuyet#{n+1}",
    description: "mang lai huong vi ngot ngao",
    quantity: 20,
    images: "/assets/dr9.jpeg",
    rating: "5",
    categories_id: 1
end
