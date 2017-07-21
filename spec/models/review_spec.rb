require 'rails_helper'

RSpec.describe Review, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"


  it { should belong_to(:shop) }

  it { should validate_presence_of(:author) }
  it { should validate_presence_of(:price) }
  it { should validate_presence_of(:rating) }
  it { should validate_presence_of(:content) }

end
