class Post < ApplicationRecord
  belongs_to :user
  has_many :comments
  
  validates :title, presence: true
  validates :title, length: { minimum: 2, maximum: 16 }
  validates :title, uniqueness: true

  validates :body, presence: true
  validates :body, length: { minimum: 2, maximum: 1000}
end
