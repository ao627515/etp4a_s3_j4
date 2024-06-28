require_relative '../lib/mairie_christmas'

describe "fetch_townhall_emails" do
  it "should not return an empty array" do
    expect(fetch_townhall_emails).not_to be_empty
  end

  it "should return an array of hashes" do
    expect(fetch_townhall_emails).to all(be_a(Hash))
  end

  it "should include some known towns" do
    emails = fetch_townhall_emails
    towns = emails.map(&:keys).flatten
    expect(towns).to include('Avernes', 'Ambleville')
  end
end

describe "decode_email" do
  it "should decode the obfuscated email correctly" do
    encoded_email = "/cdn-cgi/l/email-protection#5f3271323e362d363a1f3a253e31293633333a71392d"
    decoded_email = decode_email(encoded_email.split('#').last)
    expect(decoded_email).to eq('expected_email@example.com') # Remplacez par l'e-mail décodé attendu
  end
end

describe "get_townhall_email" do
  it "should return a valid email address for a given townhall URL" do
    townhall_url = 'https://www.annuaire-mairie.fr/ville-ezanville.html'
    email = get_townhall_email(townhall_url)
    expect(email).to match(/\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i) # Vérifie si l'email est dans un format valide
  end
end

describe "get_townhall_urls" do
  it "should return an array of URLs" do
    urls = get_townhall_urls
    expect(urls).not_to be_empty
    expect(urls).to all(be_a(String))
    expect(urls.first).to match(/^https:\/\/www\.annuaire-mairie\.fr\//) # Vérifie si l'URL commence par le bon préfixe
  end
end
