OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, "1750417735190833", "314e908e68b8c18525ac85f8e6b1c80e"

end


