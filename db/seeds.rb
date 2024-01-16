# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


User.delete_all
us00 = User.create!(email: "aku@gmail.com", password: "password")

Product.delete_all
us00 = Product.create!(email: "aku@gmail.com", password: "password")

Product.delete_all
pp00 = Product.create!(
  name:'cute bear baby knit hat',
  image: nil,
  image_url: "https://ae01.alicdn.com/kf/Se8fb6ef862ac432aa5b23fbb2bd5aab6L/Cute-Bear-Baby-Knit-Hat-Solid-Color-Soft-Comfortable-Toddler-Beanies-for-Boy-Girl-Cartoon-Autumn.jpg_.webp",
  description: "cute bear baby knit hat solid color soft comfortable toddler beanies for boy girl cartoon autumn winter warm kids knitted hat",
  user_id: 1,
  price: 0.2099e2,
  category_productitemtype_id: nil,
  category_productstyle_id: nil,
  category_productsubtype_id: nil,
  category_producttype_id: nil
)

# level_01
CategoryProducttype.delete_all
cpt00 = CategoryProducttype.create!(name: 'men', code_name: 'p_cat_men', user_id: 1)
cpt00 = CategoryProducttype.create!(name: 'women', code_name: 'p_cat_women', user_id: 1)
cpt00 = CategoryProducttype.create!(name: 'kids', code_name: 'p_cat_kids_boys', user_id: 1)
cpt00 = CategoryProducttype.create!(name: 'product', code_name: 'p_cat_product', user_id: 1)


# level_02
CategoryProductitemtype.delete_all
cc00 = CategoryProductitemtype.create!(name: 'accessories', code_name: 'p_type_accessories', user_id: 1)
cc00 = CategoryProductitemtype.create!(name: 'coats & jackets', code_name: 'p_type_coats', user_id: 1)
cc00 = CategoryProductitemtype.create!(name: 'clothing', code_name: 'p_type_clothing', user_id: 1)
cc00 = CategoryProductitemtype.create!(name: 'footwear', code_name: 'p_type_footwear', user_id: 1)


# level_03
CategoryProductsubtype.delete_all
# accessories
cc00 = CategoryProductsubtype.create!(name: 'belts', code_name: 'p_subtype_belts', category_productitemtype_id: 1, admin_id: 1)
cc00 = CategoryProductsubtype.create!(name: 'gloves', code_name: 'p_subtype_gloves', category_productitemtype_id: 1, admin_id: 1)
cc00 = CategoryProductsubtype.create!(name: 'hats & caps', code_name: 'p_subtype_hats', category_productitemtype_id: 1, admin_id: 1)
cc00 = CategoryProductsubtype.create!(name: 'hair accessories', code_name: 'p_subtype_hair_acc', category_productitemtype_id: 1, admin_id: 1)
# coats & jackets
cc00 = CategoryProductsubtype.create!(name: 'jackets', code_name: 'p_subtype_jackets', category_productitemtype_id: 2, admin_id: 1)
cc00 = CategoryProductsubtype.create!(name: 'coats', code_name: 'p_subtype_coats', category_productitemtype_id: 2, admin_id: 1)
cc00 = CategoryProductsubtype.create!(name: 'capes', code_name: 'p_subtype_capes', category_productitemtype_id: 2, admin_id: 1)
cc00 = CategoryProductsubtype.create!(name: 'gilet', code_name: 'p_subtype_gilet', category_productitemtype_id: 2, admin_id: 1)
# clothing
cc00 = CategoryProductsubtype.create!(name: 'dresses', code_name: 'p_subtype_dresses', category_productitemtype_id: 3, admin_id: 1)
cc00 = CategoryProductsubtype.create!(name: 'tops & tees', code_name: 'p_subtype_tops_tees', category_productitemtype_id: 3, admin_id: 1)
cc00 = CategoryProductsubtype.create!(name: 'bottoms & trousers', code_name: 'p_subtype_bottoms_trousers', category_productitemtype_id: 3, admin_id: 1)
cc00 = CategoryProductsubtype.create!(name: 'jeans', code_name: 'p_subtype_jeans', category_productitemtype_id: 3, admin_id: 1)
# footwear
cc00 = CategoryProductsubtype.create!(name: 'boots', code_name: 'p_subtype_boots', category_productitemtype_id: 4, admin_id: 1)
cc00 = CategoryProductsubtype.create!(name: 'flats', code_name: 'p_subtype_flats', category_productitemtype_id: 4, admin_id: 1)
cc00 = CategoryProductsubtype.create!(name: 'shoes', code_name: 'p_subtype_shoes', category_productitemtype_id: 4, admin_id: 1)
cc00 = CategoryProductsubtype.create!(name: 'shoes accessories', code_name: 'p_subtype_shoes_accessories', category_productitemtype_id: 4, admin_id: 1)

# level_04
CategoryProductstyle.delete_all
# accessories/belts
cc00 = CategoryProductstyle.create!(name: 'buckle', code_name: 'p_style_buckle', category_productsubtype_id: 0, admin_id: 1)
cc00 = CategoryProductstyle.create!(name: 'non buckle', code_name: 'p_style_non_buckle', category_productsubtype_id: 0, admin_id: 1)
# accessories/gloves
cc00 = CategoryProductstyle.create!(name: 'knitted', code_name: 'p_style_knitted', category_productsubtype_id: 0, admin_id: 1)
cc00 = CategoryProductstyle.create!(name: 'fingerless', code_name: 'p_style_fingerless', category_productsubtype_id: 0, admin_id: 1)
# accessories/hats & caps
cc00 = CategoryProductstyle.create!(name: 'hats', code_name: 'p_style_mitten', category_productsubtype_id: 0, admin_id: 1)
cc00 = CategoryProductstyle.create!(name: 'caps', code_name: 'p_style_caps', category_productsubtype_id: 0, admin_id: 1)