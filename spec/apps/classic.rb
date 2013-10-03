require "sinatra"
require File.expand_path("../../../lib/sinatra/fuzzy_layout.rb", __FILE__)

enable_layout_for :one
disable_layout_for "one", :two, /f\w{3}/

get '/' do
  erb :index, :layout => false
end

get('/one') { erb :one }
get('/two') { erb :two }
get('/three') { erb :three }
get('/four') { erb :four, :layout => true }
get('/five') { erb :five, :layout => false }
