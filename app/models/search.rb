class Search < ApplicationRecord
  validates :sentence, presence: true, length: { minimum: 10 }
end
