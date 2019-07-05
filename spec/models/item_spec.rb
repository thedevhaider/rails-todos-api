require 'rails_helper'

# Test suite for Item Model
RSpec.describe Item, type: :model do
  # Association Testing
  # Ensure Item model has belongs_to relationship with Todo Model
  it { should belong_to(:todo) } 

  # Validation Test
  # Ensure the column name is present before saving it into database
  it { should validate_presence_of(:name) }
end
