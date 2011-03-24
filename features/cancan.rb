versioned_gem 'cancan'

after_bundle do
  generate 'cancan:ability'
  
  inject_into_file 'app/controllers/application_controller.rb', :before => /\nend\n/ do
<<INJECT_END

  # Ensure that all actions check authorization by default
  check_authorization :unless => :devise_controller?
  
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => exception.message
  end
INJECT_END
  end
end
