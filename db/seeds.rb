Categories.create category_name: "Food"
Categories.create category_name: "Drink"
20.times do |n|
  Product.create! price:  (n+1),
    product_name: "Che Tuyet#{n+1}",
    description: "mang lai huong vi ngot ngao",
    quantity: 20,
    images: "/assets/dr9.jpeg",
    rating: "5",
    categories_id: 1
end

15.times do |u|
  User.create! name: "User" + (u+1).to_s,
  address: "nghe an",
  phone: "242431",
  email: "user#{u+1}@gmail.com",
  password: "123456"
end
