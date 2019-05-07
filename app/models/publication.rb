class Publication < ApplicationRecord
  belongs_to :author

  validates :body, :title, :publication_date, presence: true
end
