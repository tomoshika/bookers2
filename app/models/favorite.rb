class Favorite < ApplicationRecord

  validates :user_id, presence: true
  validates :book_id, presence: true, uniqueness: {scope: :user_id}
  # validates_uniqueness_of :book_id, scope: :user_id
  belongs_to :user
  belongs_to :book
end
