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
cpit02 = CategoryProductitemtype.create!(name: 'coats & jackets', code_name: 'p_type_coats',user_id: us01.id)
cpit03 = CategoryProductitemtype.create!(name: 'clothing', code_name: 'p_type_clothing',user_id: us01.id)
cpit04 = CategoryProductitemtype.create!(name: 'footwear', code_name: 'p_type_footwear',user_id: us01.id)
cpit05 = CategoryProductitemtype.create!(name: 'gifts', code_name: 'p_type_gifts',user_id: us01.id)
cpit06 = CategoryProductitemtype.create!(name: 'skincare', code_name: 'p_type_skincare',user_id: us01.id)
cpit07 = CategoryProductitemtype.create!(name: 'home furnishing', code_name: 'p_type_home_furnishing',user_id: us01.id)
cpit08 = CategoryProductitemtype.create!(name: 'furniture', code_name: 'p_type_furniture',user_id: us01.id)
cpit09 = CategoryProductitemtype.create!(name: 'home & gardening', code_name: 'p_type_home_gardening',user_id: us01.id)
cpit10 = CategoryProductitemtype.create!(name: 'mother care', code_name: 'p_type_mother_care',user_id: us01.id)
cpit11 = CategoryProductitemtype.create!(name: 'phones, cellphones & telecommunications', code_name: 'p_type_phones_telecom',user_id: us01.id)
cpit12 = CategoryProductitemtype.create!(name: 'computer & office', code_name: 'p_type_comp_office',user_id: us01.id)
cpit13 = CategoryProductitemtype.create!(name: 'education & office supplies', code_name: 'p_type_education',user_id: us01.id)
cpit14 = CategoryProductitemtype.create!(name: 'security & protection', code_name: 'p_type_security',user_id: us01.id)
cpit15 = CategoryProductitemtype.create!(name: 'consumer electronics', code_name: 'p_type_consumer_electronics',user_id: us01.id)
cpit16 = CategoryProductitemtype.create!(name: 'pet supplies', code_name: 'p_type_pet',user_id: us01.id)
cpit17 = CategoryProductitemtype.create!(name: 'toys & hobbies', code_name: 'p_type_toys',user_id: us01.id)
cpit18 = CategoryProductitemtype.create!(name: 'musical instruments', code_name: 'p_type_musical',user_id: us01.id)
cpit19 = CategoryProductitemtype.create!(name: 'hair extensions & wigs', code_name: 'p_type_hair',user_id: us01.id)
cpit20 = CategoryProductitemtype.create!(name: 'salon equipments', code_name: 'p_type_salon',user_id: us01.id)
cpit21 = CategoryProductitemtype.create!(name: 'automobiles & motorcycles', code_name: 'p_type_auto',user_id: us01.id)
cpit22 = CategoryProductitemtype.create!(name: 'sport equipments', code_name: 'p_type_sport_equip',user_id: us01.id)
cpit23 = CategoryProductitemtype.create!(name: 'construction & real estate', code_name: 'p_type_construction_estate',user_id: us01.id)


# level_03
CategoryProductsubtype.delete_all
# accessories
cps01 = CategoryProductsubtype.create!(name: 'belts', code_name: 'p_subtype_belts', category_productitemtype_id: cpit01.id, user_id: us01.id)
cps02 = CategoryProductsubtype.create!(name: 'gloves', code_name: 'p_subtype_gloves', category_productitemtype_id: cpit01.id, user_id: us01.id)
cps03 = CategoryProductsubtype.create!(name: 'hats & caps', code_name: 'p_subtype_hats', category_productitemtype_id: cpit01.id, user_id: us01.id)
cps04 = CategoryProductsubtype.create!(name: 'hair accessories', code_name: 'p_subtype_hair_acc', category_productitemtype_id: cpit01.id, user_id: us01.id)
cps05 = CategoryProductsubtype.create!(name: 'handbags & purses', code_name: 'p_subtype_handbags', category_productitemtype_id: cpit01.id, user_id: us01.id)
cps06 = CategoryProductsubtype.create!(name: 'jewellery', code_name: 'p_subtype_jewellery', category_productitemtype_id: cpit01.id, user_id: us01.id)
cps07 = CategoryProductsubtype.create!(name: 'sunglasses', code_name: 'p_subtype_sunglasses', category_productitemtype_id: cpit01.id, user_id: us01.id)
cps08 = CategoryProductsubtype.create!(name: 'scarves', code_name: 'p_subtype_scarves', category_productitemtype_id: cpit01.id, user_id: us01.id)
cps09 = CategoryProductsubtype.create!(name: 'umbrellas', code_name: 'p_subtype_umbrellas', category_productitemtype_id: cpit01.id, user_id: us01.id)
cps10 = CategoryProductsubtype.create!(name: 'watches', code_name: 'p_subtype_watches', category_productitemtype_id: cpit01.id, user_id: us01.id)
cps11 = CategoryProductsubtype.create!(name: 'handkerchiefs', code_name: 'p_subtype_handkerchiefs', category_productitemtype_id: cpit01.id, user_id: us01.id)
cps12 = CategoryProductsubtype.create!(name: 'ties & bow ties', code_name: 'p_subtype_ties_bows', category_productitemtype_id: cpit01.id, user_id: us01.id)
# coats & jackets
cps13 = CategoryProductsubtype.create!(name: 'jackets', code_name: 'p_subtype_jackets', category_productitemtype_id: cpit02.id, user_id: us01.id)
cps14 = CategoryProductsubtype.create!(name: 'coats', code_name: 'p_subtype_coats', category_productitemtype_id: cpit02.id, user_id: us01.id)
cps15 = CategoryProductsubtype.create!(name: 'capes', code_name: 'p_subtype_capes', category_productitemtype_id: cpit02.id, user_id: us01.id)
cps16 = CategoryProductsubtype.create!(name: 'gilet', code_name: 'p_subtype_gilet', category_productitemtype_id: cpit02.id, user_id: us01.id)
# clothing
cps17 = CategoryProductsubtype.create!(name: 'dresses', code_name: 'p_subtype_dresses', category_productitemtype_id: cpit03.id, user_id: us01.id)
cps18 = CategoryProductsubtype.create!(name: 'tops & tees', code_name: 'p_subtype_tops_tees', category_productitemtype_id: cpit03.id, user_id: us01.id)
cps19 = CategoryProductsubtype.create!(name: 'bottoms & trousers', code_name: 'p_subtype_bottoms_trousers', category_productitemtype_id: cpit03.id, user_id: us01.id)
cps20 = CategoryProductsubtype.create!(name: 'jeans', code_name: 'p_subtype_jeans', category_productitemtype_id: cpit03.id, user_id: us01.id)
cps21 = CategoryProductsubtype.create!(name: 'skirts', code_name: 'p_subtype_skirts', category_productitemtype_id: cpit03.id, user_id: us01.id)
cps22 = CategoryProductsubtype.create!(name: 'jumpsuits & bodysuits', code_name: 'p_subtype_jumpsuits', category_productitemtype_id: cpit03.id, user_id: us01.id)
cps23 = CategoryProductsubtype.create!(name: 'sweaters & jumpers', code_name: 'p_subtype_sweaters_jumpers', category_productitemtype_id: cpit03.id, user_id: us01.id)
cps24 = CategoryProductsubtype.create!(name: 'suits & tailoring', code_name: 'p_subtype_suits_tailoring', category_productitemtype_id: cpit03.id, user_id: us01.id)
cps25 = CategoryProductsubtype.create!(name: 'nightwear & underwear', code_name: 'p_subtype_nightwear', category_productitemtype_id: cpit03.id, user_id: us01.id)
cps26 = CategoryProductsubtype.create!(name: 'clothing uniforms', code_name: 'p_subtype_clothing_uniforms', category_productitemtype_id: cpit03.id, user_id: us01.id)
cps27 = CategoryProductsubtype.create!(name: 'sportswear', code_name: 'p_subtype_sportswear', category_productitemtype_id: cpit03.id, user_id: us01.id)
cps28 = CategoryProductsubtype.create!(name: 'clothing accessories', code_name: 'p_subtype_clothing_accessories', category_productitemtype_id: cpit03.id, user_id: us01.id)
# footwear
cps29 = CategoryProductsubtype.create!(name: 'boots', code_name: 'p_subtype_boots', category_productitemtype_id: cpit04.id, user_id: us01.id)
cps30 = CategoryProductsubtype.create!(name: 'flats', code_name: 'p_subtype_flats', category_productitemtype_id: cpit04.id, user_id: us01.id)
cps31 = CategoryProductsubtype.create!(name: 'shoes', code_name: 'p_subtype_shoes', category_productitemtype_id: cpit04.id, user_id: us01.id)
cps32 = CategoryProductsubtype.create!(name: 'shoes accessories', code_name: 'p_subtype_shoes_accessories', category_productitemtype_id: cpit04.id, user_id: us01.id)

# gifts
# skincare
# home furnishing
# furniture
# home & gardening
# mother care
# phones, cellphones & telecommunications
# computer & office
# education & office supplies
# security & protection
# consumer electronics
# pet supplies
# toys & hobbies
# musical instruments
# hair extensions & wigs
# salon equipments
# automobiles & motorcycles
# sport equipments
# construction & real estate





















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