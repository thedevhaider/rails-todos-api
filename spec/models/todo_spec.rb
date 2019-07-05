require 'rails_helper'

# Test suite for Todo Model
RSpec.describe Todo, type: :model do
  # Association Test
  # Ensure Todo model has 1:m relationship with the Item Model
  it { should have_many(:items).dependent(:destroy) }

  # Validation Test
  # Ensure column title and created_by are present before saving
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:created_by) }
end
