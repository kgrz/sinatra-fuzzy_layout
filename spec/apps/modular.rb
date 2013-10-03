require "sinatra/base"
require File.expand_path("../../../lib/sinatra/fuzzy_layout.rb", __FILE__)

class SampleApp < Sinatra::Base
  register Sinatra::FuzzyLayout

  enable_layout_for :one
  disable_layout_for "one"
  disable_layout_for /f\w{3}/

  get '/' do
    erb :index, :layout => false
  end

  get('/one') { erb :one }
  get('/two') { erb :two }
  get('/three') { erb :three }
  get('/four') { erb :four }
  get('/five') { erb :five }
end
