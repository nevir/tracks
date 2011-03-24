# Enable sqlite for dev & test to get you up and running initially
apply 'http://datamapper.org/templates/rails.rb', :database => 'sqlite'

# dm-rails mows over the generated gemfile.  Let's fix it
latest_rails = latest_version('rails')
latest_datamapper = latest_version('data_mapper')

gsub_file 'Gemfile', /(RAILS_VERSION\s+= '~> )([\d\.]+)/, "\\1#{latest_rails}"
gsub_file 'Gemfile', /(DM_VERSION\s+= '~> )([\d\.]+)/, "\\1#{latest_datamapper}"
gsub_file 'Gemfile', /(gem 'dm-rails',\s+)('~> [\d\.]+')/, "\\1DM_VERSION"
