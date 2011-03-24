versioned_gem 'jquery-rails'

after_bundle do
  generate 'jquery:install --force'
  
  remove_file 'public/javascripts/jquery.min.js'
end
