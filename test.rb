require 'webrick'

server = WEBrick::HTTPServer.new({
  :DocumentRoot => '.',
  :CGIInterpreter => WEBrick::HTTPServlet::CGIHandler::Ruby,
  :Port => '3000',
})
['INT', 'TERM'].each {|signal|
  Signal.trap(signal){ server.shutdown }
}

server.mount('/', WEBrick::HTTPServlet::ERBHandler, 'home.html.erb')

server.mount('/accueil', WEBrick::HTTPServlet::ERBHandler, 'accueil.html.erb')

# Ajouter cette ligne
server.mount('/indicate.cgi', WEBrick::HTTPServlet::CGIHandler, 'indicate.rb')
server.mount('/goya.cgi', WEBrick::HTTPServlet::CGIHandler, 'goya.rb')
server.mount('/goyagood.cgi', WEBrick::HTTPServlet::CGIHandler, 'goyagood.rb')
server.mount('/goyabad.cgi', WEBrick::HTTPServlet::CGIHandler, 'goyabad.rb')


server.start