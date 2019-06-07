module Api
  class Engine < ::Rails::Engine
    isolate_namespace Api

        
    config.middleware.insert_before 0, Rack::Cors do
      allow do
        origins 'http://localhost:3001', 'http://localhost:3000'
        resource '*', headers: :any, methods: [:get, :post, :options]
      end
    end

  end
end
