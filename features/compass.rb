versioned_gem 'compass'

after_bundle do
  run 'compass init rails --syntax sass --sass-dir app/stylesheets --css-dir public/stylesheets --prepare'
  
  create_file 'app/stylesheets/application.sass' do
    "@import \"compass/reset\"\n"
  end
end
