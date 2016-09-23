Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '900264360083283', '0d71f907600aca52f53a5d0303816583'
end
