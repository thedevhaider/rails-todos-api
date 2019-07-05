class Item < ApplicationRecord
  # Association
  belongs_to :todo

  # Validation
  validates_presence_of :name, on: :create, message: "can't be blank"
end
