require 'nokogiri'
require 'open-uri'

# Cette méthode scrappe les cours des cryptomonnaies depuis CoinMarketCap
def fetch_crypto_prices
  # Ouvre la page web de CoinMarketCap
  page = Nokogiri::HTML(URI.open('https://coinmarketcap.com/all/views/all/'))

  # Initialisation d'un array pour stocker les cryptomonnaies et leurs cours
  crypto_array = []

  # Sélectionne les éléments HTML contenant les noms et les prix des cryptomonnaies
  page.css('tr.cmc-table-row').each do |row|
    # Récupère le nom de la cryptomonnaie
    name = row.css('td.cmc-table__cell--sort-by__symbol').text

    # Récupère le prix de la cryptomonnaie et le convertit en float
    price = row.css('td.cmc-table__cell--sort-by__price').text.gsub(/[^\d\.]/, '').to_f

    # Ajoute un hash avec le nom et le prix dans l'array
    crypto_array << { name => price }

    # Affiche le nom et le prix pour vérifier que tout fonctionne
    puts "#{name}: $#{price}"
  end

  # Retourne l'array des cryptomonnaies et leurs prix
  crypto_array
end

# Appelle la méthode pour exécuter le scraping
fetch_crypto_prices
