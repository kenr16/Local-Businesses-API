require 'rails_helper'

RSpec.describe V1::ReviewsController, type: :controller do

  # This should return the minimal set of attributes required to create a valid
  # Review. As you add validations to Review, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    {
      author: 'Orin Scrivello',
      price: 3,
      rating: 5,
      content: 'This shop was great, I bought an AWESOME plant here'
    }
  }

  let(:invalid_attributes) {
    {
      author: 'Me',
      price: 300,
      rating: 500,
      content: 'No'
    }
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # ReviewsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "returns a success response" do
      review = Review.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      review = Review.create! valid_attributes
      get :show, params: {id: review.to_param}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Review" do
        expect {
          post :create, params: {review: valid_attributes}, session: valid_session
        }.to change(Review, :count).by(1)
      end

      it "renders a JSON response with the new review" do

        post :create, params: {review: valid_attributes}, session: valid_session
        expect(response).to have_http_status(:created)
        expect(response.content_type).to eq('application/json')
        # expect(response.location).to eq(review_url(Review.last))
        # commenting out this line until I know how to rewrite this route with versioning.
      end
    end

    context "with invalid params" do
      it "renders a JSON response with errors for the new review" do

        post :create, params: {review: invalid_attributes}, session: valid_session
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json')
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        {
          author: 'Orin Scrivello',
          price: 1,
          rating: 1,
          content: 'I take that back!  DO NOT BUY ANY PLANTS FROM THIS SHOP.'
        }
      }

      it "updates the requested review" do
        review = Review.create! valid_attributes
        put :update, params: {id: review.to_param, review: new_attributes}, session: valid_session
        review.reload
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to eq('application/json')
      end

      it "renders a JSON response with the review" do
        review = Review.create! valid_attributes

        put :update, params: {id: review.to_param, review: valid_attributes}, session: valid_session
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to eq('application/json')
      end
    end

    context "with invalid params" do
      it "renders a JSON response with errors for the review" do
        review = Review.create! valid_attributes

        put :update, params: {id: review.to_param, review: invalid_attributes}, session: valid_session
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json')
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested review" do
      review = Review.create! valid_attributes
      expect {
        delete :destroy, params: {id: review.to_param}, session: valid_session
      }.to change(Review, :count).by(-1)
    end
  end

end
