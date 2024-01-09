class Search < ApplicationRecord
  belongs_to :user
  validates :sentence, presence: true, length: { minimum: 10 }

  scope :keyword_counts, -> { group(:sentence).order('count_sentence DESC').count(:sentence) }
end
