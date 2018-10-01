class User < ApplicationRecord
  has_many :posts 
  has_many :comments
  has_many :commented_posts, through: :comments, source: :post

  validates :name, presence: true
  validates :name, length: { minimum: 2, maximum: 16 }
  validates :name, uniqueness: true
end
