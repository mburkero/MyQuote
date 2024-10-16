class Author < ApplicationRecord
  has_many :quotes,  dependent: :destroy
  validates :authName, presence: true
end
