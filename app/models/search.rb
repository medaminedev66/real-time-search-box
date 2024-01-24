class Search < ApplicationRecord
  belongs_to :user
  validates :sentence, presence: true, length: { minimum: 10 }

  scope :keyword_counts, -> { group("TRIM(BOTH FROM sentence)").order('count_sentence DESC').count(:sentence) }
  scope :current_week, -> { where(created_at: Time.current.beginning_of_week..Time.current.end_of_week) }
  scope :previous_week, -> { where(created_at: 1.week.ago.beginning_of_week..1.week.ago.end_of_week) }
  scope :current_day, -> { where(created_at: Time.current.beginning_of_day..Time.current.end_of_day) }
  scope :previous_day, -> { where(created_at: 1.day.ago.beginning_of_day..1.day.ago.end_of_day) }
end
