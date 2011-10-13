# Complile stylesheets for production using:
# compass compile --force

require 'sass/plugin/rack'

use Sass::Plugin::Rack

configure :production do
  use Rack::Static,
      urls: ['stylesheets'],
      root: File.expand_path('../tmp'.__FILE__)

  Sass::Plugin.options.merge!(template_location: 'views/stylesheets',
                              css_location: 'tmp/stylesheets')
end

configure :development do
  sass_dir = File.join 'views', 'stylesheets'
  images_dir = File.join 'public', 'images'
  http_path = "/"
  http_images_path = "/images"
  http_stylesheets_path = "/stylesheets"
end
