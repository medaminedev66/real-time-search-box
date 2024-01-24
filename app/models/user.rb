class User < ApplicationRecord
  has_many :searches
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  scope :current_month, -> { where(created_at: Time.current.beginning_of_day..Time.current.end_of_day) }
  scope :previous_month, -> { where(created_at: 1.month.ago.beginning_of_day..1.month.ago.end_of_day) }
end
