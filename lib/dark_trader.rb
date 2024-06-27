require 'nokogiri'
require 'open-uri'

# Cette méthode scrappe les cours des cryptomonnaies depuis CoinMarketCap
def fetch_crypto_prices
  # Ouvre la page web de CoinMarketCap
  page = Nokogiri::HTML(URI.open('https://coinmarketcap.com/all/views/all/'))

  # Initialisation d'un array pour stocker les cryptomonnaies et leurs cours
  crypto_array = []

  # Utilisation de xpath pour sélectionner les lignes de la table contenant les données des cryptomonnaies
  page.xpath('//tr[contains(@class, "cmc-table-row")]').each do |row|
    # Récupère le nom de la cryptomonnaie
    name = row.xpath('.//td[contains(@class, "cmc-table__cell--sort-by__symbol")]').text.strip

    # Récupère le prix de la cryptomonnaie et le convertit en float
    price = row.xpath('.//td[contains(@class, "cmc-table__cell--sort-by__price")]').text.strip.gsub(/[^\d\.]/, '').to_f

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
