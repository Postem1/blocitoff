require 'rails_helper'

RSpec.describe User, type: :model do

  let(:user) { User.create!(email: "user@bloccit.com", password: "password") }

  it { is_expected.to validate_presence_of(:password) }

  describe "attributes" do
    it "should have email attribute" do
      expect(user).to have_attributes(email: "user@bloccit.com")
    end
  end

  describe "invalid user" do
    let(:user_with_invalid_email) { User.new(email: "") }

    it "should be an invalid user due to blank email" do
      expect(user_with_invalid_email).to_not be_valid
    end
  end
end
