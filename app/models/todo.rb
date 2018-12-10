class Todo < ApplicationRecord
  belongs_to :user
  validates :title, :description, :user, presence: true
end
