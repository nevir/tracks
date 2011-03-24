versioned_gem 'devise'
versioned_gem 'dm-devise'

after_bundle do
  generate 'devise:install'
  generate 'devise User'
  
  # Make sure we've got action mailer hooked up
  uncomment_line 'config/application.rb', "require 'action_mailer/railtie'"
  
  # And related settings
  inject_into_file 'config/environments/development.rb', :before => /\nend\n/ do
<<INJECT

  # The base URL to use when constructing links back to your application
  config.action_mailer.default_url_options = { :host => 'localhost:3000' }
INJECT
  end
  uncomment_line 'config/initializers/devise.rb', 'config.mailer = "Devise::Mailer"'
end
