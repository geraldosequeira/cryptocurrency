require "rails_helper"

RSpec.describe "Exchanges", type: :request do
    
    describe "/" do
        it "returns http sucess" do 
            get "/"
            expect(response).to have_http_status(200)
        end 
    end

    describe "GET convert" do 
        before do 
            @amount = rand(1...999)
        end

        it "returns http sucess" do 
            get "/convert", params: {
                source_currency: "EUR",
                target_currency: "BRA",
                amount: @amount
            }
            expect(response).to have_http_status(200)
        end

    end
end