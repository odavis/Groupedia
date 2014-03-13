Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, "bF6vHX7FXc31nz1Bejm4nQ", "lZO79YHUe4D3VDMdkYtULRc9u5DYEVGkLfegSNfCReg"
  provider :facebook, ENV['FB_ID'], ENV['FB_Secret']
end