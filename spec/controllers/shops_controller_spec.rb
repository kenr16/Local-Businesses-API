require 'rails_helper'

RSpec.describe ShopsController, type: :controller do

  # This should return the minimal set of attributes required to create a valid
  # Shop. As you add validations to Shop, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
    { name: 'Rob', years: '28' }
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # ShopsController. Be sure to keep this updated too.
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
        skip("Add a hash of attributes valid for your model")
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
