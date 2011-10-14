class Calavera < Sinatra::Base
  
  before do
    cache_control :public, :max_age => 14515200 # 6 months
  end

  get '/' do
    @title = "Calavera Construction Co."
    erb :index
  end
  
  get '/project' do
    @title = "Calavera: Project Construction"
    erb :project
  end
  
  get '/installation' do
    @title = "Calavera: Building & Installation"
    erb :installation
  end
  
  get '/exhibition' do
    @title = "Calavera: Exhibition & Display Furniture"
    erb :exhibition
  end
  
  get '/art' do
    @title = "Calavera: Art Handling & Installation"
    erb :art
  end
  
  get '/crates' do
    @title = "Calavera: Crate-making"
    erb :crates
  end
  
  get '/about' do
    @title = "Calavera: About"
    erb :about
  end
  
  get '/contact' do
    @title = "Calavera: Contact"
    erb :contact
  end
  
  get '/stylesheets/:name.css' do
    content_type 'text/css', :charset => 'utf-8'
    scss(:"stylesheets/#{params[:name]}", Compass.sass_engine_options)
  end

end
