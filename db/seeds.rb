Categories.create category_name: "Food"
Categories.create category_name: "Drink"
20.times do |n|
  Product.create! price:  (n+1),

    productName: "Che Tuyet#{n+1}",

    product_name: "Che Tuyet",

    description: "mang lai huong vi ngot ngao",
    quantity: 20,
    images: "/assets/dr9.jpeg",
    rating: "5",
    categories_id: 1
end


Product.create product_name: "che khuc bach"
Product.create price: 20000
Product.create description: "hap dan"
Product.create quantily: 10
Product.create images: "/assets/dr9.jpeg"
Product.create rating: "Tuyet voi"
Product.create categories_id: 2

