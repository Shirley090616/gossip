require 'csv'

class Gossip
  attr_accessor:id, :author, :content

    def initialize(id, author, content)
      @id = id
      @author = author
      @content = content
    end 
    
    def save
        CSV.open("./db/gossip.csv", "ab") do |csv|
          csv << [@author, @content]
        end
      end

      def self.all
        all_gossips = []
        CSV.read("./db/gossip.csv").each do |csv_line|
          all_gossips << Gossip.new(csv_line[0], csv_line[1])
        end
        return all_gossips
      end

      def self.find(id)
        all_gossips = self.all  # Supposons que tu as une méthode all qui charge tous les potins
        all_gossips.each do |gossip|
          return gossip if gossip.id == id.to_i  # Vérifie si l'id correspond et renvoie le potin
        end
        nil  # Si aucun potin n'a été trouvé, retourne nil
      end
      
      get '/' do
        erb :index, locals: { gossips: Gossip.all }
      end

end