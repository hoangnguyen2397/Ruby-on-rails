require 'rails_helper'

RSpec.describe User, type: :model do
  describe "Associations" do
    it "has many articles" do
      association = described_class.reflect_on_association(:articles)
      expect(association.macro).to eq :has_many
    end
  end
end

RSpec.describe User, type: :model do
  describe "Validations" do
    subject { create(:user) }

    it "is valid with valid attributes" do
      expect(subject).to be_valid
    end

    it "is not valid without a title" do
	    subject.email = nil
      is_expected.not_to be_valid
    end
  end
end