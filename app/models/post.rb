class Post < ApplicationRecord
  belongs_to :user
  belongs_to :category

  validates :body, length: {minimum: 1, maximum: 550}, presence: true
end
