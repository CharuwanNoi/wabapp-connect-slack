OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  # provider :slack, "3130740703.20845259318", "ad89889ce485aa2bfb453ca26abb6c43", 
  # scope: "client"

  provider :slack, "3130740703.20845259318", "ad89889ce485aa2bfb453ca26abb6c43", 
  scope: "identify,read,post", team: 'T033UMSLP'
end