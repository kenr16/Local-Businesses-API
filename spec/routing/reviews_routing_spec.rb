require "rails_helper"

RSpec.describe V1::ReviewsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/v1/reviews").to route_to("v1/reviews#index")
    end


    it "routes to #show" do
      expect(:get => "/v1/reviews/1").to route_to("v1/reviews#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/v1/reviews").to route_to("v1/reviews#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/v1/reviews/1").to route_to("v1/reviews#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/v1/reviews/1").to route_to("v1/reviews#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/v1/reviews/1").to route_to("v1/reviews#destroy", :id => "1")
    end

  end
end
