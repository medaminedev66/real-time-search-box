class Search < ApplicationRecord
  belongs_to :user
  validates :sentence, presence: true, length: { minimum: 10 }
end
