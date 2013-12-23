require "sinatra"
require_relative "model.rb"

configure do
  set :erb, :layout => :'meta-layout/layout'
  #set :erb, :locals => {:title => "", :tagline => ''}

  #AppConfig = YAML.load_file(File.expand_path("config.yaml", File.dirname(__FILE__)))
end

get "/" do
  erb :index
end