class WebhooksController < ApplicationController
  skip_forgery_protection

  def stripe
    # handles all webhook from stripe
    stripe_secret_key = ENV["ST_ART_STRIPE_API_KEY_TEST"]
    Stripe.api_key = stripe_secret_key
    payload = request.body.read

    # the signature key that stripe sends to us and we use the webhook & payload key to verify that is stripe calling our webhook
    # and now someone else
    sig_header = request.env["HTT_STRIPE_SIGNATURE"]
    endpoint_secret = ENV["ST_ART_STRIPE_WEBHOOK_SECRET_TEST"]
  end
end
