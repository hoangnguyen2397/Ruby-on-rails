require 'rails_helper'
RSpec.describe ArticleWorker, type: :worker do
  let(:article) { create(:article) }
  
  describe 'testing worker' do
    it 'update the status' do
      ArticleWorker.perform_async(article.id)
      expect(ArticleWorker).to have_enqueued_sidekiq_job(article.id)
    end
  end
end
