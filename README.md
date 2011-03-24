# Tracks
Beefy rails templates to get you up and running with everything you need in a clean slate project.  Each template provides a collection of features, which typically align to a given gem.  

To build a project with the template of your choice, do the standard rails thing:

    rails new project_name -m https://github.com/nevir/tracks/raw/master/ideal.rb

The templates attempt to use the latest stable version of each gem.  In some cases, you will encounter gem version conflicts.  You can manually override the version of gems by specifying "--gemname version".  Versions can be either numbers or git URLs:

    rails new project_name -m https://github.com/nevir/tracks/raw/master/ideal.rb --dm-devise https://github.com/jm81/dm-devise --devise https://github.com/plataformatec/devise
