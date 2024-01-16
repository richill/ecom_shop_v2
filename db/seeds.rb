# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


User.delete_all
us01 = User.create!(email: "aku@gmail.com", password: "password")
us02 = User.create!(email: "richill@gmail.com", password: "password")


# level_01
CategoryProducttype.delete_all
cpt01 = CategoryProducttype.create!(name: 'men', code_name: 'p_cat_men', user_id: us01.id)
cpt02 = CategoryProducttype.create!(name: 'women', code_name: 'p_cat_women', user_id: us01.id)
cpt03 = CategoryProducttype.create!(name: 'kids (boys)', code_name: 'p_cat_kids_boys', user_id: us01.id)
cpt04 = CategoryProducttype.create!(name: 'kids (girls)', code_name: 'p_cat_kids_girls', user_id: us01.id)
cpt05 = CategoryProducttype.create!(name: 'product', code_name: 'p_cat_product', user_id: us01.id)

# level_02
CategoryProductitemtype.delete_all
cpit01 = CategoryProductitemtype.create!(name: 'accessories', code_name: 'p_type_accessories', user_id: us01.id)
cpit02 = CategoryProductitemtype.create!(name: 'coats & jackets', code_name: 'p_type_coats', user_id: us01.id)
cpit03 = CategoryProductitemtype.create!(name: 'clothing', code_name: 'p_type_clothing', user_id: us01.id)
cpit04 = CategoryProductitemtype.create!(name: 'footwear', code_name: 'p_type_footwear', user_id: us01.id)


# level_03
CategoryProductsubtype.delete_all
# accessories
cps01 = CategoryProductsubtype.create!(name: 'belts', code_name: 'p_subtype_belts', category_productitemtype_id: cpit01.id, user_id: us01.id)
cps02 = CategoryProductsubtype.create!(name: 'gloves', code_name: 'p_subtype_gloves', category_productitemtype_id: cpit01.id, user_id: us01.id)
cps03 = CategoryProductsubtype.create!(name: 'hats & caps', code_name: 'p_subtype_hats', category_productitemtype_id: cpit01.id, user_id: us01.id)
cps04 = CategoryProductsubtype.create!(name: 'hair accessories', code_name: 'p_subtype_hair_acc', category_productitemtype_id: cpit01.id, user_id: us01.id)
# coats & jackets
cps05 = CategoryProductsubtype.create!(name: 'jackets', code_name: 'p_subtype_jackets', category_productitemtype_id: cpit02.id, user_id: us01.id)
cps06 = CategoryProductsubtype.create!(name: 'coats', code_name: 'p_subtype_coats', category_productitemtype_id: cpit02.id, user_id: us01.id)
cps07 = CategoryProductsubtype.create!(name: 'capes', code_name: 'p_subtype_capes', category_productitemtype_id: cpit02.id, user_id: us01.id)
cps08 = CategoryProductsubtype.create!(name: 'gilet', code_name: 'p_subtype_gilet', category_productitemtype_id: cpit02.id, user_id: us01.id)
# clothing
cps09 = CategoryProductsubtype.create!(name: 'dresses', code_name: 'p_subtype_dresses', category_productitemtype_id: cpit03.id, user_id: us01.id)
cps10 = CategoryProductsubtype.create!(name: 'tops & tees', code_name: 'p_subtype_tops_tees', category_productitemtype_id: cpit03.id, user_id: us01.id)
cps11 = CategoryProductsubtype.create!(name: 'bottoms & trousers', code_name: 'p_subtype_bottoms_trousers', category_productitemtype_id: cpit03.id, user_id: us01.id)
cps12 = CategoryProductsubtype.create!(name: 'jeans', code_name: 'p_subtype_jeans', category_productitemtype_id: cpit03.id, user_id: us01.id)
# footwear
cps13 = CategoryProductsubtype.create!(name: 'boots', code_name: 'p_subtype_boots', category_productitemtype_id: cpit04.id, user_id: us01.id)
cps14 = CategoryProductsubtype.create!(name: 'flats', code_name: 'p_subtype_flats', category_productitemtype_id: cpit04.id, user_id: us01.id)
cps15 = CategoryProductsubtype.create!(name: 'shoes', code_name: 'p_subtype_shoes', category_productitemtype_id: cpit04.id, user_id: us01.id)
cps16 = CategoryProductsubtype.create!(name: 'shoes accessories', code_name: 'p_subtype_shoes_accessories', category_productitemtype_id: cpit04.id, user_id: us01.id)

# level_04
CategoryProductstyle.delete_all
# accessories/belts
cpst01 = CategoryProductstyle.create!(name: 'buckle', code_name: 'p_style_buckle', category_productsubtype_id: cps01.id, user_id: us01.id)
cpst02 = CategoryProductstyle.create!(name: 'non buckle', code_name: 'p_style_non_buckle', category_productsubtype_id: cps01.id, user_id: us01.id)
# accessories/gloves
cpst03 = CategoryProductstyle.create!(name: 'knitted', code_name: 'p_style_knitted', category_productsubtype_id: cps02.id, user_id: us01.id)
cpst04 = CategoryProductstyle.create!(name: 'fingerless', code_name: 'p_style_fingerless', category_productsubtype_id: cps02.id, user_id: us01.id)
# accessories/hats & caps
cpst05 = CategoryProductstyle.create!(name: 'hats', code_name: 'p_style_mitten', category_productsubtype_id: cps03.id, user_id: us01.id)
cpst06 = CategoryProductstyle.create!(name: 'caps', code_name: 'p_style_caps', category_productsubtype_id: cps03.id, user_id: us01.id)
# accessories/hair accessories
cpst07 = CategoryProductstyle.create!(name: 'headbands', code_name: 'p_style_headbands', category_productsubtype_id: cps04.id, user_id: us01.id)
cpst08 = CategoryProductstyle.create!(name: 'hair clips', code_name: 'p_style_hair_clips', category_productsubtype_id: cps04.id, user_id: us01.id)
# --------------------------------------
# coats & jackets/jackets
cpst09 = CategoryProductstyle.create!(name: 'puffer jacket', code_name: 'p_style_puffer_jacket', category_productsubtype_id: cps05.id, user_id: us01.id)
cpst10 = CategoryProductstyle.create!(name: 'parkas', code_name: 'p_style_parkas', category_productsubtype_id: cps05.id, user_id: us01.id)
# coats & jackets/coats
cpst11 = CategoryProductstyle.create!(name: 'puffer coats', code_name: 'p_style_puffer_coats', category_productsubtype_id: cps06.id, user_id: us01.id)
cpst12 = CategoryProductstyle.create!(name: 'tweed coats', code_name: 'p_style_tweed_coats', category_productsubtype_id: cps06.id, user_id: us01.id)
# coats & jackets/capes
cpst13 = CategoryProductstyle.create!(name: 'ponchos', code_name: 'p_style_ponchos', category_productsubtype_id: cps07.id, user_id: us01.id)
cpst14 = CategoryProductstyle.create!(name: 'kimonos', code_name: 'p_style_kimonos', category_productsubtype_id: cps07.id, user_id: us01.id)
# coats & jackets/gilet
cpst15 = CategoryProductstyle.create!(name: 'puffer', code_name: 'p_style_puffer', category_productsubtype_id: cps08.id, user_id: us01.id)
cpst16 = CategoryProductstyle.create!(name: 'teddy', code_name: 'p_style_teddy', category_productsubtype_id: cps08.id, user_id: us01.id)
# --------------------------------------
# clothing/dresses
cpst17 = CategoryProductstyle.create!(name: 'occasion dress', code_name: 'p_style_occasion_dress', category_productsubtype_id: cps09.id, user_id: us01.id)
cpst18 = CategoryProductstyle.create!(name: 'casual dress', code_name: 'p_style_casual_dress', category_productsubtype_id: cps09.id, user_id: us01.id)
# clothing/tops & tees
cpst19 = CategoryProductstyle.create!(name: 'shirts', code_name: 'p_style_shirts', category_productsubtype_id: cps10.id, user_id: us01.id)
cpst20 = CategoryProductstyle.create!(name: 'tuxedo shirts', code_name: 'p_style_tuxedo_shirts', category_productsubtype_id: cps10.id, user_id: us01.id)
# clothing/bottoms & trousers
cpst21 = CategoryProductstyle.create!(name: 'shorts', code_name: 'p_style_shorts', category_productsubtype_id: cps11.id, user_id: us01.id)
cpst22 = CategoryProductstyle.create!(name: 'sweatpants', code_name: 'p_style_shorts', category_productsubtype_id: cps11.id, user_id: us01.id)
# clothing/jeans
cpst23 = CategoryProductstyle.create!(name: 'dark wash', code_name: 'p_style_dark_wash', category_productsubtype_id: cps12.id, user_id: us01.id)
cpst24 = CategoryProductstyle.create!(name: 'mid wash', code_name: 'p_style_mid_wash', category_productsubtype_id: cps12.id, user_id: us01.id)
# --------------------------------------
# footwear/boots
cpst25 = CategoryProductstyle.create!(name: 'casual boots', code_name: 'p_style_casual_boots', category_productsubtype_id: cps13.id, user_id: us01.id)
cpst26 = CategoryProductstyle.create!(name: 'smart boots', code_name: 'p_style_smart_boots', category_productsubtype_id: cps13.id, user_id: us01.id)
# footwear/flats
cpst27 = CategoryProductstyle.create!(name: 'sliders & slippers', code_name: 'p_style_sliders_slippers', category_productsubtype_id: cps14.id, user_id: us01.id)
cpst28 = CategoryProductstyle.create!(name: 'flip flops', code_name: 'p_style_flip_flops', category_productsubtype_id: cps14.id, user_id: us01.id)
# footwear/shoes
cpst29 = CategoryProductstyle.create!(name: 'loafers', code_name: 'p_style_loafers', category_productsubtype_id: cps15.id, user_id: us01.id)
cpst30 = CategoryProductstyle.create!(name: 'pumps', code_name: 'p_style_pumps', category_productsubtype_id: cps15.id, user_id: us01.id)
# footwear/shoes accessories
cpst31 = CategoryProductstyle.create!(name: 'shoe decorations', code_name: 'p_style_shoe_decorations', category_productsubtype_id: cps16.id, user_id: us01.id)
cpst32 = CategoryProductstyle.create!(name: 'insoles', code_name: 'p_style_insoles', category_productsubtype_id: cps16.id, user_id: us01.id)



# products
Product.delete_all
pp01 = Product.create!(
  name:'cute bear baby knit hat',
  image: nil,
  image_url: "https://ae01.alicdn.com/kf/Se8fb6ef862ac432aa5b23fbb2bd5aab6L/Cute-Bear-Baby-Knit-Hat-Solid-Color-Soft-Comfortable-Toddler-Beanies-for-Boy-Girl-Cartoon-Autumn.jpg_.webp",
  description: "cute bear baby knit hat solid color soft comfortable toddler beanies for boy girl cartoon autumn winter warm kids knitted hat",
  user_id: us01.id,
  price: 0.2099e2,
  impressions_count: 0,
  category_producttype_id: cpt02.id,        #women
  category_productitemtype_id: cpit01.id,   #accessories
  category_productstyle_id: cpst05.id,      #hats & caps
  category_productsubtype_id: cps03.id,     #hats
  )