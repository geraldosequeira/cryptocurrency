RSpec.configure do |config|
    config.before(:each) do   
      stub_request(:get, /api.bitcointrade.com.br/ )
      .with(
        headers: {'Accept'=>'*/*'}
    ).to_return(
        status: 200,
        body:'
            "message": null,
            "data": {
                "high": 28600,
                "low": 25723.03,
                "volume": 129.62897394,
                "trades_quantity": 2416,
                "last": 27802.01,
                "sell": 27997,
                "buy": 27850,
                "date": "2018-07-17T18:59:29.830Z"
            }', 
        headers: {}
    )
    end
  end