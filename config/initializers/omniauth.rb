OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '356142354529621', 'b9f72179a916aa22fab6ea8c615e1221'
end