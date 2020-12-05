require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe "Validator" do
    it { should validate_presence_of(:body) }
  end

  describe 'Association' do
    it { should belong_to(:user) }
    it { should belong_to(:movie) }
  end
end
