class Movie < ApplicationRecord
  has_many :bookmarks
  validates :title, uniqueness: true
  validates :title, :overview, presence: true
  has_many :lists, through: :bookmarks, dependent: :destroy
end
