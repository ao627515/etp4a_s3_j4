require_relative '../lib/cher_depute'  
# Chargement du fichier cher_depute.rb qui contient la méthode fetch_deputy_emails

describe "fetch_deputy_emails" do
  it "should not return an empty array" do
    expect(fetch_deputy_emails).not_to be_empty  
    # Vérifie que la méthode fetch_deputy_emails ne retourne pas un array vide
  end

  it "should return an array of hashes" do
    expect(fetch_deputy_emails).to all(be_a(Hash))  
    # Vérifie que tous les éléments retournés par fetch_deputy_emails sont des hashes
  end

  it "should include some known deputies" do
    deputies = fetch_deputy_emails  # Appelle fetch_deputy_emails pour obtenir la liste des députés
    first_names = deputies.map { |deputy| deputy['first_name'] }  # Extrait les prénoms des députés retournés
    expect(first_names).to include('Jean', 'Martin')  # Vérifie que les prénoms 'Jean' et 'Martin' sont inclus dans la liste des prénoms des députés
  end
end
