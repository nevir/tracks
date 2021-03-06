class << self
  def relative_apply(path)
    apply File.join(File.dirname(__FILE__), path)
  end
end

relative_apply 'helpers/hooks.rb'
relative_apply 'helpers/lines.rb'
relative_apply 'helpers/versioning.rb'

# The actual features
relative_apply 'features/dm-rails.rb' # MUST be first, since it overwrites the Gemfile
relative_apply 'features/slim.rb'
relative_apply 'features/jquery.rb'
relative_apply 'features/compass.rb'
relative_apply 'features/barista.rb'
relative_apply 'features/devise.rb'
relative_apply 'features/cancan.rb'
relative_apply 'features/welcome.rb'

# Final tasks
run 'bundle install'
execute_after_bundle
rake 'db:setup'
