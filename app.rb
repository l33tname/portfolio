require "sinatra"
require "yaml"

def loadAllProjects
  $AllProjects = Array.new

  path = File.expand_path("projecte/*.yaml", File.dirname(__FILE__))

  Dir.glob(path) do |project|
    parsedProject = YAML.load_file(project)
    $AllProjects << parsedProject if parsedProject["published"]
  end
end

configure do
  set :erb, :layout => :'meta-layout/layout'
  set :erb, :locals => {:title => "Portfolio", :tagline => "Build software with <3"}

  loadAllProjects
end

get "/" do
  erb :index, :locals => { :projects => $AllProjects }
end