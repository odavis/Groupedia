Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, "bF6vHX7FXc31nz1Bejm4nQ", "lZO79YHUe4D3VDMdkYtULRc9u5DYEVGkLfegSNfCReg"
  provider :facebook, "317755455029862", "33b5f56a1c59cb7326660d81abdbb0a1"
end