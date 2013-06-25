require "sinatra/base"
require "haml"
require "sinatra/fuzzy_layout"

class SampleApp < Sinatra::Base
  register Sinatra::FuzzyLayout

  enable_layout_for :one
  disable_layout_for "one", "two", /f\w{3}/

  get '/' do 
    haml :index, :layout => false
  end

  get('/one') { haml :one }
  get('/two') { haml :two }
  get('/three') { haml :three }
  get('/four') { haml :four }
  get('/five') { haml :five }
end
