require 'rails_helper'

RSpec.describe Shop, type: :model do

  it { should have_many(:reviews).dependent(:destroy) }

  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:address) }
  it { should validate_presence_of(:description) }
  it { should validate_presence_of(:url) }
  it { should validate_presence_of(:hours) }


end
