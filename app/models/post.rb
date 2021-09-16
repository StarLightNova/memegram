class Post < ApplicationRecord
  belongs_to :user

  validates :body, length: {minimum: 1, maximum: 550}, presence: true
end
