require 'rails_helper'

RSpec.describe ShopsController, type: :controller do

  let(:valid_attributes) {
    {
      name: 'Mushniks Flower Shop',
      address: '28 Skid Row, New York City',
      description: 'A little shop of horrors...',
      url: 'https://www.connectva.org/wp-content/uploads/2015/06/Little-Shop-of-Horrors2.jpg',
      hours: "8:00am - 7:00pm"
    }
  }

  let(:invalid_attributes) {
    {
      name: 'M',
      address: '28 Worth Street, Skid Row, Bowery, Manhattan borough, Southern part, New York City, Long Island, New York State, United States of America, North America, Western Hemisphere, Earth, Solar System, Local, Group, Milky Way.',
      description: 'Great',
      url: '',
      hours: "8"
    }
  }

  let(:valid_session) { {} }

  describe "GET #index" do
    it "returns a success response" do
      shop = Shop.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      shop = Shop.create! valid_attributes
      get :show, params: {id: shop.to_param}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Shop" do
        expect {
          post :create, params: {shop: valid_attributes}, session: valid_session
        }.to change(Shop, :count).by(1)
      end

      it "renders a JSON response with the new shop" do

        post :create, params: {shop: valid_attributes}, session: valid_session
        expect(response).to have_http_status(:created)
        expect(response.content_type).to eq('application/json')
        expect(response.location).to eq(shop_url(Shop.last))
      end
    end

    context "with invalid params" do
      it "renders a JSON response with errors for the new shop" do

        post :create, params: {shop: invalid_attributes}, session: valid_session
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json')
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        {
          name: 'Waxwork Museum',
          address: '123 Museum street, Everytown USA',
          description: 'A wax museum with several interesting exhibits...',
          url: 'http://horrormovies.net/wp-content/uploads/2016/04/knmadnaXfq4YMUrxm2y8J8FRH9C-640x300.jpg',
          hours: "8:00am - 7:00pm"
        }
      }

      it "updates the requested shop" do
        shop = Shop.create! valid_attributes
        put :update, params: {id: shop.to_param, shop: new_attributes}, session: valid_session
        shop.reload
        skip("Add assertions for updated state")
      end

      it "renders a JSON response with the shop" do
        shop = Shop.create! valid_attributes

        put :update, params: {id: shop.to_param, shop: valid_attributes}, session: valid_session
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to eq('application/json')
      end
    end

    context "with invalid params" do
      it "renders a JSON response with errors for the shop" do
        shop = Shop.create! valid_attributes

        put :update, params: {id: shop.to_param, shop: invalid_attributes}, session: valid_session
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json')
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested shop" do
      shop = Shop.create! valid_attributes
      expect {
        delete :destroy, params: {id: shop.to_param}, session: valid_session
      }.to change(Shop, :count).by(-1)
    end
  end

end
