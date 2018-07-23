require "spec_helper"
require "json"
require "./app/services/exchange_service"

describe "Currency" do
  it "exchange" do
    amount = "#{rand(0..9999)}"
    res = ExchangeService.new("USD", "BRL", amount).perform
    expect(res.is_a? Numeric).to eql(true)
    expect(res != 0 || amount == 0).to eql(true)
  end

  it "exchange BTC" do 
    res = ExchangeService.new("", "", "#{rand(0..9999)}").perform_btc
    expect(res.is_a? Numeric).to eql(true)
    expect(res != 0).to eql(true)
  end

end