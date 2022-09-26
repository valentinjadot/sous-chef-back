Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins 'https://sous-chef.vercel.app'
    resource '*', headers: :any, methods: [:get, :post, :patch]
  end
end
