Category.create category_name: "Food"
Category.create category_name: "Drink"
20.times do |n|
  Product.create! price:  (n+1),
    product_name: "Che Tuyet#{n+1}",
    description: "mang lai huong vi ngot ngao",
    quantity: 20,
    images: "/assets/dr9.jpeg",
    rating: "5",
    category_id: 1
end

10.times do |n|
  Comment.create! product_id: (n+1),
    user_id: 1,
    comment: "hap dan qua#{n+1}"
end
5.times do |u|
  User.create! name: "User" + (u+1).to_s,
  address: "nghe an",
  phone: "242431",
  email: "user#{u+1}@gmail.com",
  password: "123456"
end

10.times do |n|
  Order.create! total: (n+100000),
  status: true,
  user_id: 1
end
2.times do |n|
  Order.create! total: (n+100000),
  status: false,
  user_id: 2
end
12.times do |n|
  OrderDetail.create! quantity_ordered: (n+1),
  price_each: (n+10000),
  product_id: (n+1),
  order_id: 1
end
10.times do |n|
  Suggest.create! suggest: "admin cho them mon che buoi vao di#{n+1}",
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          user_id: (n+1)
end

User.create name: "adminabc", email: "adminabc@example.com",
  phone: "123456", address: "144 Xuan Thuy", is_admin: true,
  password: "123456", password_confirmation: "123456"
