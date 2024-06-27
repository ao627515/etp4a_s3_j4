require_relative '../lib/cher_depute'

describe "fetch_deputy_emails" do
  it "should not return an empty array" do
    expect(fetch_deputy_emails).not_to be_empty
  end

  it "should return an array of hashes" do
    expect(fetch_deputy_emails).to all(be_a(Hash))
  end

  it "should include some known deputies" do
    deputies = fetch_deputy_emails
    first_names = deputies.map { |deputy| deputy['first_name'] }
    expect(first_names).to include('Jean', 'Martin')
  end
end
