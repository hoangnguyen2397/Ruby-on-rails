require 'rails_helper'

RSpec.describe ArticleJob, type: :job do
  let(:article) { create(:article) }
  
  describe '#perform_later' do
    it 'update the status' do
      ActiveJob::Base.queue_adapter = :test
      expect{
        ArticleJob.perform_later(article)
      }.to have_enqueued_job
    end
  end
end
