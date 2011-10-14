require	'rubygems'
require 'bundler'

Bundler.require

require './app.rb'

configure do
  set :sass, {:style => :compressed, :debug_info => false}

  Compass.configuration do |config|
    config.output_style = :compact 
    config.line_comments =false 
    config.sass_dir = File.join('views', 'stylesheets')
    config.images_dir = File.join('public', 'images')
    config.http_path = "/"
    config.http_images_path = "/images"
    config.http_stylesheets_path = "/stylesheets"
  end

  set :sass, Compass.sass_engine_options 
end

# Sass on Heroku
configure :production do
  require 'sass/plugin/rack'

  use Sass::Plugin::Rack
  use Rack::Static,
      urls: ['stylesheets'],
      root: File.expand_path('../tmp', __FILE__)

  Sass::Plugin.options.merge!(template_location: 'views/stylesheets',
                              css_location: 'tmp/stylesheets')
end

run Calavera 
