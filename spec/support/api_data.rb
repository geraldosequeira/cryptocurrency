RSpec.configure do |config|
    config.before(:each) do   
      stub_request(:get, /currencydatafeed.com/)
      .with(
        headers: {'Accept'=>'*/*'}
    ).to_return(
        status: 200,
        body:'{
            "status": true,
            "currency": [
                {
                    "currency": "USD/BRL",
                    "value": "3.41325",
                    "date": "2018-04-20 17:22:59",
                    "type": "original"
                }
            ]
          }', 
        headers: {}
    )
    end

    config.before(:each) do   
        stub_request(:get, /api.bitcointrade.com.br/)
        .with(
          headers: {'Accept'=>'*/*'}
      ).to_return(
          status: 200,
          body:'{
            "message": null,
            "data": {
            "high": 29799.99,
            "low": 28700,
            "volume": 69.22547414,
            "trades_quantity": 1844,
            "last": 29645,
            "sell": 29695,
            "buy": 29645,
            "date": "2018-07-23T19:02:56.463Z"
            }
            }', 
          headers: {}
      )
      end
end