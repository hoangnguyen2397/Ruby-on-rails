require 'rails_helper'

RSpec.describe ArticlePolicy, type: :policy do
  let(:article) { Article.new }

  subject { described_class }
  
  permissions :create? do
    let(:user) { User.new }
    it "allows you to create article" do
      expect(subject).to permit(user, :article)
    end
  end

end
