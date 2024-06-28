# require 'nokogiri'
# require 'open-uri'

# # Cette méthode récupère l'e-mail d'une mairie à partir de son URL
# def get_townhall_email(townhall_url)
#   # Ouvre la page web de la mairie
#   page = Nokogiri::HTML(URI.open(townhall_url))

#   # Utilise XPath pour sélectionner l'e-mail dans le tableau à la 4ème ligne et 2ème colonne
# #   email = page.xpath('//div[@id="mairie_content"]//div[@class="ville_info"]//p/strong/a')
#   email = page.xpath('//a')

#   puts email.length
# #   puts email.inspect
#   puts email['href']
#   puts
#   puts
#   # Retourne l'e-mail
#   email
# end

# # Cette méthode récupère les URLs de toutes les mairies du Val d'Oise
# def get_townhall_urls
#   # Ouvre la page web de l'annuaire des mairies du Val d'Oise
#   page = Nokogiri::HTML(URI.open('https://www.annuaire-mairie.fr/departement-val-d-oise.html'))

#   # Initialise un array pour stocker les URLs
#   urls = []

#   # Sélectionne les liens vers les pages des mairies en utilisant la classe 'lientxt'
#   page.xpath('//div[@id="intercommunalite_content"]//table[@class="tblmaire"]//tbody//a').each do |link|
#     # Construit l'URL complète de la mairie
#     url = "https://www.annuaire-mairie.fr" + link['href']

#     # Ajoute l'URL à l'array
#     urls << url
#   end

#   # Retourne l'array des URLs
#   urls
# end

# # Cette méthode scrappe les e-mails des mairies du Val d'Oise
# def fetch_townhall_emails
#   # Récupère les URLs des mairies
#   urls = get_townhall_urls

#   # Initialise un array pour stocker les e-mails et les noms des villes
#   emails = []

#   # Itère sur chaque URL pour récupérer les e-mails
#   urls.each do |url|
#     # Récupère l'e-mail de la mairie
#     # puts url
#     email = get_townhall_email(url)
#     break 

#     # Extrait le nom de la ville de l'URL
#     town_name = url.split('/').last.split('.').first.capitalize
#     # town_name = url.text

#     # Ajoute un hash contenant le nom de la ville et l'e-mail à l'array
#     emails << { town_name => email }

#     # Affiche le nom de la ville et l'e-mail pour vérifier que tout fonctionne
#     # puts "#{town_name}: #{email}"
#   end

#   # Retourne l'array des e-mails et des noms des villes
#   emails
# end

# # Appelle la méthode pour exécuter le scraping
# fetch_townhall_emails
