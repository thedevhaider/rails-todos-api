class Todo < ApplicationRecord
    # Association Testing
    has_many :items, dependent: :destroy

    # Validation
    validates_presence_of :title, :created_by, on: :create, message: "can't be blank"
end
