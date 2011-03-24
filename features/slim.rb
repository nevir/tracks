versioned_gem 'slim', :require => 'slim/rails'
versioned_gem 'slim-rails'

after_bundle do
  remove_file 'app/views/layouts/application.html.erb'
  
  create_file 'app/views/layouts/application.html.slim' do
<<FILE_END
doctype html
html
  head
    title #{app_name.titleize}
    = stylesheet_link_tag :all
    = javascript_include_tag :defaults
    = csrf_meta_tag
  body
    = yield
FILE_END
  end
  
  inject_into_file 'config/environments/development.rb', :before => /\nend\n/ do
<<INJECT_END

  # Have slim spit out pretty html for easier debugging
  Slim::Engine.set_default_options :pretty => true, :tabsize => 2
INJECT_END
  end
  
end
