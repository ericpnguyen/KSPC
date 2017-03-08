# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'
Devise.secret_key = '097ba96c3052a5542a3abd521c98d78e88bddc0a6d014d0eae78f00ded0a3838e97948e137929e08b5b49c2b9bc11253ddb7ae735ceed1a054b6d45209e9a9ac'

Rails.application.config.assets.precompile += %w( video-js.swf vjs.eot vjs.svg vjs.ttf vjs.woff )
# Add additional assets to the asset load path
# Rails.application.config.assets.paths << Emoji.images_path

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
# Rails.application.config.assets.precompile += %w( search.js )
