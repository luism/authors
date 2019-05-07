class Author < ApplicationRecord
  has_many :publications

  validates :name, :email, presence: true
end
