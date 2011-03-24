require 'json'

class << self
  # Pulls in the specified gem, and defaults it to ~> the latest version.
  # 
  # The user can also specify the version via the command line by specifying the gem name as an
  # option, followed by the version number or a git source url.
  def versioned_gem(name, options={})
    opts = Thor::Options.parse({:opt => Thor::Option.new(name, nil, nil, :string)}, ARGV)
    version = (opts.include? name) ? opts[name] : latest_version(name)
    
    # git?
    if version =~ /.+:\/\/.+/
      gem name, :git => version
    # or regular
    else
      gem name, "~> #{version}", options
    end
  end
  
  # Gets the latest version for a given gem
  def latest_version(name)
    return JSON.parse(open("http://rubygems.org/api/v1/gems/#{name}.json").read)['version']
  end
end
