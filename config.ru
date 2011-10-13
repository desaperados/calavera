require	'rubygems'
require 'bundler'

Bundler.require

require './app.rb'

configure do
  set :scss, {:style => :compressed, :debug_info => false}
  #Compass.add_project_configuration(File.join(Sinatra::Application.root, 'config', 'compass.rb'))
  #sass_dir = File.join 'views', 'stylesheets'
  #images_dir = File.join 'public', 'images'
  #http_path = "/"
  #http_images_path = "/images"
  #http_stylesheets_path = "/stylesheets"
end

Compass.configuration do |config|
  config.output_style = :compressed 
  config.line_comments = true
end

require 'sass/plugin/rack'
use Sass::Plugin::Rack

configure :production do
  use Rack::Static,
      urls: ['stylesheets'],
      root: File.expand_path('../tmp', __FILE__)

  Sass::Plugin.options.merge!(template_location: 'views/stylesheets',
                              css_location: 'tmp/stylesheets')
end

run Calavera 
