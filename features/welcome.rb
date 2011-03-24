after_bundle do
  remove_file 'public/index.html'
  generate 'controller welcome home'
  route "root :to => 'welcome#home'"
  
  inject_into_file 'app/controllers/welcome_controller.rb', :after => /class WelcomeController < ApplicationController\n/ do
    "  skip_authorization_check\n\n"
  end
end
