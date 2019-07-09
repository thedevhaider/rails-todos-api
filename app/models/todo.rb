class Todo < ApplicationRecord
    # Association Testing
    has_many :items, dependent: :destroy, foreign_key: "todo_id"

    # Validation
    validates_presence_of :title, :created_by
end
