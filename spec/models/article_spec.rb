require 'rails_helper'

RSpec.describe Article, type: :model do
    describe "Associations" do
      it "belongs to user" do
        #reflect_on_association: check information about association
        association = described_class.reflect_on_association(:user)
        #Associations are implemented using macro-style calls
        expect(association.macro).to eq :belongs_to
      end
    end 
end

RSpec.describe Article, type: :model do
  describe "Validations" do
    subject { create(:article) }
    
    it 'is valid with valid attributes' do
      is_expected.to be_valid
    end

    it 'is not valid without a title' do
      subject.title = nil
      is_expected.to_not be_valid
    end

    it 'is not valid with too short body' do
      subject.body = "a" * 9
      is_expected.to_not be_valid
    end
  end
end