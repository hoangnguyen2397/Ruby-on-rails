class Article < ApplicationRecord
  include Visible

  belongs_to :user
  has_many :comments, dependent: :destroy

  validates :title, presence: true
  validates :body, presence: true, length: { minimum: 10 }

  def publish!
    update(status: 'public')
  end

  def make_expire!
    update(status: 'archived')
  end
end
