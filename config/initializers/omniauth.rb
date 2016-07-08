OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2,  '741816943815-7u816v6enqk6lokiabds4vj1h3hikb3i.apps.googleusercontent.com', 'ocEi121Qh6QYqrvhxoWqkqAK', {client_options: {ssl: {ca_file: Rails.root.join("cacert.pem").to_s}}}
end