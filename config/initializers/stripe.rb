if Rails.env.development?
  #development
  Stripe.api_key = ENV["ST_ART_STRIPE_API_KEY_TEST"]
elsif Rails.env.production?
  # production
  Stripe.api_key = ENV["ST_ART_STRIPE_API_KEY_TEST"]
end