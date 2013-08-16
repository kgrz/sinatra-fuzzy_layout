require "sinatra/base"
require "haml"
require File.expand_path("../../lib/sinatra/fuzzy_layout.rb", __FILE__)

class SampleAppMultiple < Sinatra::Base
  register Sinatra::FuzzyLayout

  enable_layout_for :one
  disable_layout_for "one"
  disable_layout_for "two", /f\w{3}/

  get '/' do 
    haml :index, :layout => false
  end

  get('/one') { haml :one }
  get('/two') { haml :two }
  get('/three') { haml :three }
  get('/four') { haml :four }
  get('/five') { haml :five }
end
