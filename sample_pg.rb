require 'pg'

Connectez-vous à goyaDB depuis ruby avec # PG :: connect (dbname: "goya")
# Stockez les informations de connexion dans une variable nommée connection
connection = PG::connect(dbname: "goya")
connection.internal_encoding = "UTF-8"
begin
  Manipulez PostgreSQL à l'aide de la variable # connection
  Dans # .exec, goyaDB "select weight, give_for from crop;"
  Exécutez l'instruction # SQL directement et stockez le résultat dans la variable result
  result = connection.exec("select weight, give_for from crops;")

  # Traiter chaque ligne récupérée
  result.each do |record|
      # Prenez chaque ligne et sortez-la sur le terminal avec des put
      puts "La taille de la courge amère：#{record["weight"]}　Qui a vendu：#{record["give_for"]}"
  end
ensure
  #Enfin, déconnectez la connexion à la base de données avec .finish
  connection.finish
end