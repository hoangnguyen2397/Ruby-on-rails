require 'rails_helper'

RSpec.describe "Articles", type: :request do
  
  let(:valid_attributes) do
    {
      'id' => '1',
      'title' => 'Test',
      'body' => '12345',
      'status' => 'public'
    }
  end

  describe "GET /index" do
    it 'renders a successful response' do
      article = Article.new(valid_attributes)
      article.save
      get articles_path
      expect(response).to be_successful
    end
  end

  describe 'GET /new' do
    it 'renders a successful response' do
      user = User.new(email: "example@example.com", password: "Test123")
      sign_in user
      get new_article_path
      expect(response).to   
    end
  end

end
