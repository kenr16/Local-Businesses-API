require 'rails_helper'

RSpec.describe Review, type: :model do

  it { should belong_to(:shop) }

  it { should validate_presence_of(:author) }
  it { should validate_presence_of(:price) }
  it { should validate_presence_of(:rating) }
  it { should validate_presence_of(:content) }

end
