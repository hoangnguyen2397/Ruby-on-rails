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

  describe "GET articles" do
    it 'renders a successful response' do
      article = Article.new(valid_attributes)
      article.save
      #debugger
      get '/articles'
      expect(response).to be_successful
    end
  end

  describe 'GET /new' do
    it 'renders a successful response' do
      user = create(:user)
      login_as user
      get new_article_path
      expect(response).to be_successful
    end
  end

end
