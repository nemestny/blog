class Post < ApplicationRecord
  belongs_to :user
  has_many :comments
  
  validates :title, presence: true
  validates :title, length: { minimum: 2, maximum: 500 }
  validates :title, uniqueness: true

  validates :body, presence: true
  validates :body, length: { minimum: 2, maximum: 3000}
end
