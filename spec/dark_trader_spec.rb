require_relative '../lib/dark_trader'

describe "fetch_crypto_prices" do
  it "should not return an empty array" do
    expect(fetch_crypto_prices).not_to be_empty
  end

  it "should return an array of hashes" do
    expect(fetch_crypto_prices).to all(be_a(Hash))
  end

  it "should include Bitcoin and Ethereum" do
    crypto_prices = fetch_crypto_prices
    names = crypto_prices.map(&:keys).flatten
    expect(names).to include('BTC', 'ETH')
  end
end
