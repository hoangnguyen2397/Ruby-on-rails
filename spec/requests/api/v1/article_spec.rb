require 'rails_helper'

RSpec.describe Api::V1::ArticlesController, type: :request do
    it 'renders a successful response' do
        get '/api/v1/articles'
        expect(response).to be_successful
    end
    
    it 'return a json' do
        article = create(:article)
        get '/api/v1/articles'
        expect(JSON.parse(response.body)).to include_json(
            [
                {"body"=>"This is test article", "title"=>"test article"}
            ]
        )
    end
end