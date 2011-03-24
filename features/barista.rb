versioned_gem 'barista'

after_bundle do
  generate 'barista:install'
  
  remove_file 'public/javascripts/application.js'
  create_file 'app/coffeescripts/application.coffee' do
<<FILE_END
# Place your application-specific CoffeeScript functions and classes here

FILE_END
  end
  
  gsub_file 'app/views/layouts/application.html.slim', /(javascript_include_tag ):defaults/, '\1:all'
end
