require "instagram"

Instagram.configure do |config|
  config.client_id = '7ffb6e89a4e74a23b0dc42b0ad6a6588'
  config.client_secret = '1d9bcb7f338c490f8136cdfa133b5bbd'
end


CALLBACK_URL = "http://localhost:3000/oauth/callback"