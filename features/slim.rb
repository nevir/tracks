versioned_gem 'slim', :require => 'slim/rails'
versioned_gem 'slim-rails'

after_bundle do
  remove_file 'app/views/layouts/application.html.erb'
  
  create_file 'app/views/layouts/application.html.slim' do
<<LAYOUT
doctype html
html
  head
    title #{app_name.titleize}
    = stylesheet_link_tag :all
    = javascript_include_tag :defaults
    = csrf_meta_tag
  body
    = yield
LAYOUT
  end
end
