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
  name: "arm chair",
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
  name: "body-suit",
  image_url: "https://asset1.cxnmarksandspencer.com/is/image/mands/SD_04_T92_4525S_J4_X_EC_0?wid=640&qlt=80",
  category_producttype_id: catpt01.id, #product
  category_productitemtype_id: catpit01.id, #clothing
  category_productsubtype_id: catpst02.id, #bodysuit
  category_productstyle_id: catps04.id, #casual bodysuit
  description: nil,
  admin_id: admin01,
  price: 18
)



OrderProduct.delete_all
op00 = OrderProduct.create!(product_id: "loreum", order_id: 1, quantity: 4, colour: "black")




