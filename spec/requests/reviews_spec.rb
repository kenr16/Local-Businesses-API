require 'rails_helper'

RSpec.describe "Reviews", type: :request do

  describe "GET shop/:shop_id/reviews" do
    
    let!(:reviews) { FactoryGirl.create_list(:review, 60)}
    before { get reviews_path }

    it "returns a status code of 200" do
      expect(response).to have_http_status(200)
    end

    it 'returns all reviews' do
      expect(JSON.parse(response.body).size).to eq(60)
    end


  end
end
