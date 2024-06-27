require 'nokogiri'
require 'open-uri'

# Cette méthode récupère l'e-mail d'une mairie à partir de son URL
def get_townhall_email(townhall_url)
  page = Nokogiri::HTML(URI.open(townhall_url))
  email = page.xpath('//section[2]//tr[4]/td[2]').text
  email
end

# Cette méthode récupère les URLs de toutes les mairies du Val d'Oise
def get_townhall_urls
  page = Nokogiri::HTML(URI.open('https://www.annuaire-mairie.fr/departement-val-d-oise.html'))
  urls = []

  # Sélectionne les liens vers les pages des mairies
  page.css('a.lientxt').each do |link|
    url = "http://annuaire-des-mairies.com" + link['href'][1..-1]
    urls << url
  end

  urls
end

# Cette méthode scrappe les e-mails des mairies du Val d'Oise
def fetch_townhall_emails
  urls = get_townhall_urls
  emails = []

  urls.each do |url|
    email = get_townhall_email(url)
    town_name = url.split('/').last.split('.').first.capitalize
    emails << { town_name => email }

    # Affiche le nom de la ville et l'e-mail pour vérifier que tout fonctionne
    puts "#{town_name}: #{email}"
  end

  emails
end

# Appelle la méthode pour exécuter le scraping
fetch_townhall_emails
