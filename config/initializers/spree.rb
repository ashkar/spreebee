# Configure Spree Preferences
#
# Note: Initializing preferences available within the Admin will overwrite any changes that were made through the user interface when you restart.
#       If you would like users to be able to update a setting with the Admin it should NOT be set here.
#
# In order to initialize a setting do:
# config.setting_name = 'new value'
Spree.config do |config|
  config.use_s3 = true
  config.s3_bucket = 'qapfybucket'
  config.s3_access_key = "AKIAJPQH7NG7IBNFANCQ"
  config.s3_secret = "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"
 #config.admin_interface_logo='admin/logo.png'
end

Spree.user_class = "Spree::LegacyUser"
#Spree::Config.set(logo: "store/logo.png")