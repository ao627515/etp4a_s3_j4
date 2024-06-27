require 'nokogiri'
require 'open-uri'

# Cette méthode scrappe les e-mails des députés français
def fetch_deputy_emails
  page = Nokogiri::HTML(URI.open('https://www.nosdeputes.fr/deputes'))
  deputies = []

  # Sélectionne les liens vers les pages des députés
  page.css('div.list_table a').each do |link|
    deputy_page = Nokogiri::HTML(URI.open("https://www.nosdeputes.fr" + link['href']))
    
    # Récupère les informations du député
    name = deputy_page.css('h1.title span').text.strip
    email = deputy_page.css('a.email').text.strip

    first_name = name.split.first
    last_name = name.split.last

    deputies << { 'first_name' => first_name, 'last_name' => last_name, 'email' => email }

    # Affiche les informations pour vérifier que tout fonctionne
    puts "#{first_name} #{last_name}: #{email}"
  end

  deputies
end

# Appelle la méthode pour exécuter le scraping
fetch_deputy_emails
