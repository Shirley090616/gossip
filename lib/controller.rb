require "bundler"
bundler.require

class ApplicationController < Sinatra::Base # Appli... hérite de la
    # classe sinatra et il aura les même fonctionnalites que sinatra
  get '/' do
    erb :index, locals: {gossips: Gossip.all}
    erb :new_gossip
  end

  post '/gossips/new/' do
    puts "Ce programme ne fait rien pour le moment, on va donc afficher un message dans le terminal"
  end

  post '/gossips/new/' do
    author = params["gossip_author"]
    content = params["gossip_content"]
    Gossip.new(author, content).save
    redirect '/'
  end

  get '/gossips/:id' do
    @gossip = Gossip.find(params[:id]) # Assurez-vous d'avoir la méthode find définie dans Gossip
    erb :show # Cela affichera le fichier show.erb
  end

  post '/gossips/new/' do
    puts "Salut, je suis dans le serveur"
    puts "Ceci est le contenu du hash params : #{params}"
    puts "Trop bien ! Et ceci est ce que l'utilisateur a passé dans le champ gossip_author : #{params["gossip_author"]}"
    puts "De la bombe, et du coup ça, ça doit être ce que l'utilisateur a passé dans le champ gossip_content : #{params["gossip_content"]}"
    puts "Ça déchire sa mémé, bon allez je m'en vais du serveur, ciao les BGs !"
  end

end