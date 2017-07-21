require 'rails_helper'

RSpec.describe "Shops", type: :request do
  
  describe "GET /shops" do

    let!(:shops) { FactoryGirl.create_list(:shop, 30)}
    before { get shops_path }

    it "returns a status code of 200" do
      expect(response).to have_http_status(200)
    end

    it 'returns all shops' do
      expect(JSON.parse(response.body).size).to eq(30)
    end


  end
end
