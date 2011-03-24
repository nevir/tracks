# Make sure that we can load relative paths
source_paths << File.dirname(__FILE__)

apply 'helpers/hooks.rb'
apply 'helpers/lines.rb'
apply 'helpers/versioning.rb'

# The actual features
apply 'features/dm-rails.rb'
apply 'features/devise.rb'
apply 'features/welcome.rb'

# Final tasks
run 'bundle install'
execute_after_bundle
rake 'db:setup'
