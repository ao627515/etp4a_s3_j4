require_relative '../lib/dark_trader'
# Ce ligne permet d'importer le fichier dark_trader.rb pour pouvoir tester la méthode fetch_crypto_prices.

describe "fetch_crypto_prices" do
    # describe "fetch_crypto_prices" ouvre un bloc de tests pour la méthode fetch_crypto_prices.
  
    it "should not return an empty array" do
      # it "should not return an empty array" spécifie ce que le test est censé vérifier.
  
      expect(fetch_crypto_prices).not_to be_empty
      # expect(fetch_crypto_prices) appelle la méthode fetch_crypto_prices et vérifie qu'elle ne retourne pas un array vide.
      # not_to be_empty est une assertion qui vérifie que l'objet (ici, l'array retourné par fetch_crypto_prices) n'est pas vide.
    end
  
    it "should return an array of hashes" do
      # it "should return an array of hashes" spécifie ce que le test est censé vérifier.
  
      expect(fetch_crypto_prices).to all(be_a(Hash))
      # expect(fetch_crypto_prices) appelle la méthode fetch_crypto_prices et vérifie que chaque élément de l'array retourné est un hash.
      # to all(be_a(Hash)) est une assertion qui vérifie que tous les éléments de l'array sont des instances de la classe Hash.
    end
  
    it "should include Bitcoin and Ethereum" do
      # it "should include Bitcoin and Ethereum" spécifie ce que le test est censé vérifier.
  
      crypto_prices = fetch_crypto_prices
      # crypto_prices récupère l'array retourné par fetch_crypto_prices.
  
      names = crypto_prices.map(&:keys).flatten
      # names utilise map pour extraire les clés de chaque hash dans l'array crypto_prices.
      # flatten est utilisé pour aplatir le résultat en un seul tableau.
  
      expect(names).to include('BTC', 'ETH')
      # expect(names) vérifie que le tableau names inclut les chaînes de caractères 'BTC' et 'ETH'.
      # to include('BTC', 'ETH') est une assertion qui vérifie que les valeurs spécifiées sont incluses dans l'array names.
    end
  end
  