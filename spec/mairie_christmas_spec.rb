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
