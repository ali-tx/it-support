class Article < ApplicationRecord
  belongs_to :user, :optional => true
  # has_many :comments, dependent: :destroy
  # has_one_attached :image
  validates :country, presence: true,
            length: { minimum: 5 }
  def self.search(search)
    where("country LIKE ? ", "%#{search}%")
  end
end
