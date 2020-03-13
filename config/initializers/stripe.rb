# get stripe access key
Stripe.api_key = Rails.application.credentials.dig(:stripe, :secret_key)