class User < ApplicationRecord
  has_many :posts 
  has_many :comments

  validates :name, presence: true
  validates :name, length: { minimum: 2, maximum: 16 }
  validates :name, uniqueness: true
end
