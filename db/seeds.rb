# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Admin.delete_all
admin01 = Admin.create!(
  email: "admin@gmail.com",
  password: "password",
)

User.delete_all
user01 = User.create!(
  email: "user@gmail.com",
  password: "password",
  )

CategoryProducttype.delete_all
catpt01 = CategoryProducttype.create!(name: "men", code_name: nil,  admin: admin01)
catpt02 = CategoryProducttype.create!(name: "women", code_name: nil,  admin: admin01)
catpt03 = CategoryProducttype.create!(name: "products", code_name: nil,  admin: admin01)

CategoryProductitemtype.delete_all
catpit01 = CategoryProductitemtype.create!(name: "clothing", code_name: nil, admin: admin01)
catpit02 = CategoryProductitemtype.create!(name: "accessories", code_name: nil, admin: admin01)
catpit03 = CategoryProductitemtype.create!(name: "home furnishing", code_name: nil, admin: admin01)

CategoryProductsubtype.delete_all
catpst01 = CategoryProductsubtype.create!(name: "ear-rings", code_name: nil, category_productitemtype_id: catpit02.id,  admin: admin01)
catpst02 = CategoryProductsubtype.create!(name: "bodysuit", code_name: nil, category_productitemtype_id: catpit01.id,  admin: admin01)
catpst03 = CategoryProductsubtype.create!(name: "furniture", code_name: nil, category_productitemtype_id: catpit03.id,  admin: admin01)

CategoryProductstyle.delete_all
catps01 = CategoryProductstyle.create!(name: "studs", code_name: nil, category_productsubtype_id: catpst01.id,  admin: admin01)
catps02 = CategoryProductstyle.create!(name: "clips", code_name: nil, category_productsubtype_id: catpst01.id,  admin: admin01)
catps03 = CategoryProductstyle.create!(name: "smart bodysuit", code_name: nil, category_productsubtype_id: catpst02.id,  admin: admin01)
catps04 = CategoryProductstyle.create!(name: "casual bodysuit", code_name: nil, category_productsubtype_id: catpst02.id,  admin: admin01)
catps05 = CategoryProductstyle.create!(name: "arm-chair", code_name: nil, category_productsubtype_id: catpst03.id,  admin: admin01)
catps06 = CategoryProductstyle.create!(name: "shelf", code_name: nil, category_productsubtype_id: catpst03.id,  admin: admin01)
catps07 = CategoryProductstyle.create!(name: "sofa", code_name: nil, category_productsubtype_id: catpst03.id,  admin: admin01)

Product.delete_all
prod01 = Product.create!(
  name: "armchair",
  image_url: "https://asset1.cxnmarksandspencer.com/is/image/mands/HF_05_T39_9876P_NC_X_EC_0?wid=640&qlt=80",
  category_producttype_id: catpt01.id, #product
  category_productitemtype_id: catpit03.id, #home furnishing
  category_productsubtype_id: catpst03.id, #furniture
  category_productstyle_id: catps05.id, #arm-chair
  description: nil,
  admin_id: admin01,
  price: 18
)
prod02 = Product.create!(
  name: "bodysuit",
  image_url: "https://asset1.cxnmarksandspencer.com/is/image/mands/SD_04_T92_4525S_J4_X_EC_0?wid=640&qlt=80",
  category_producttype_id: catpt01.id, #product
  category_productitemtype_id: catpit01.id, #clothing
  category_productsubtype_id: catpst02.id, #bodysuit
  category_productstyle_id: catps04.id, #casual bodysuit
  description: nil,
  admin_id: admin01,
  price: 15
)
prod03 = Product.create!(
  name: "earrings",
  image_url: "https://asset1.cxnmarksandspencer.com/is/image/mands/SD_01_T66_9397E_S0_X_EC_0?wid=640&qlt=80",
  category_producttype_id: catpt01.id, #product
  category_productitemtype_id: catpit02.id, #accessories
  category_productsubtype_id: catpst01.id, #ear-rings
  category_productstyle_id: catps01.id, #studs
  description: nil,
  admin_id: admin01,
  price: 18
)

Order.delete_all
order01 = Order.create!(customer_email: "richill@gmail.com", fulfilled: false, total: 3300, address: "258 loreum ipsum, london, uk",  admin: admin01)
order02 = Order.create!(customer_email: "emma@gmail.com", fulfilled: true, total: 0, address: "111 loreum ipsum, accra, ghana",  admin: admin01)
order03 = Order.create!(customer_email: "lily@gmail.com", fulfilled: true, total: 0, address: "234 loreum ipsum , lagos, nigeria",  admin: admin01)
order04 = Order.create!(customer_email: "test-01@gmail.com", fulfilled: true, total: 1000, address: "876 loreum ipsum, lome, togo",  admin: admin01)
order05 = Order.create!(customer_email: "rashid@gmail.com", fulfilled: false, total: 1500, address: "11 state street, accra, ghana P.O Box 6767",  admin: admin01)

OrderProduct.delete_all
op01 = OrderProduct.create!(product_id: prod03.id, order_id: order04.id, quantity: 4, colour: "black")
op02 = OrderProduct.create!(product_id: prod02.id, order_id: order01.id, quantity: 2, colour: "pink")
op03 = OrderProduct.create!(product_id: prod01.id, order_id: order01.id, quantity: 3, colour: "yellow")
op04 = OrderProduct.create!(product_id: prod02.id, order_id: order05.id, quantity: 5, colour: "pink")

Variant.delete_all
var01 = Variant.create!(
  product_id: prod03.id, #earrings
  colour: "gold",
  image_url: "https://asset1.cxnmarksandspencer.com/is/image/mands/SD_01_T66_9397E_S0_X_EC_0?wid=640&qlt=80",
  image_var: nil,
  stock: 10
)
var02 = Variant.create!(
  product_id: prod03.id, #earrings
  colour: "silver",
  image_url: "https://asset1.cxnmarksandspencer.com/is/image/mands/SD_01_T66_9442E_XX_X_EC_0?wid=640&qlt=80",
  image_var: nil,
  stock: 15
)
var03 = Variant.create!(
  product_id: prod03.id, #earrings
  colour: "black",
  image_url: "https://asset1.cxnmarksandspencer.com/is/image/mands/SD_01_T66_9752E_Y0_X_EC_0?wid=640&qlt=80",
  image_var: nil,
  stock: 1
)
var04 = Variant.create!(
  product_id: prod01.id, #arhchair
  colour: "yellow",
  image_url: "https://asset1.cxnmarksandspencer.com/is/image/mands/HF_05_T39_9343P_NC_X_EC_0?wid=640&qlt=80",
  image_var: nil,
  stock: 20
)
var05 = Variant.create!(
  product_id: prod01.id, #arhchair
  colour: "blue",
  image_url: "https://asset1.cxnmarksandspencer.com/is/image/mands/HF_05_T39_9345P_NC_X_EC_0?wid=640&qlt=80",
  image_var: nil,
  stock: 5
)
var06 = Variant.create!(
  product_id: prod01.id, #arhchair
  colour: "gray",
  image_url: "https://asset1.cxnmarksandspencer.com/is/image/mands/HF_05_T39_9876P_NC_X_EC_0?wid=640&qlt=80",
  image_var: nil,
  stock: 25
)
var07 = Variant.create!(
  product_id: prod02.id, #bodysuit
  colour: "green",
  image_url: "https://asset1.cxnmarksandspencer.com/is/image/mands/SD_04_T92_4525S_J4_X_EC_0?wid=640&qlt=80",
  image_var: nil,
  stock: 20
)
var08 = Variant.create!(
  product_id: prod02.id, #bodysuit
  colour: "pink",
  image_url: "https://asset1.cxnmarksandspencer.com/is/image/mands/SD_04_T92_2542S_A4_X_EC_90?wid=640&qlt=80",
  image_var: nil,
  stock: 25
)
var09 = Variant.create!(
  product_id: prod02.id, #bodysuit
  colour: "cream",
  image_url: "https://asset1.cxnmarksandspencer.com/is/image/mands/SD_04_T92_6534S_R4_X_EC_90?wid=640&qlt=80",
  image_var: nil,
  stock: 10
)




