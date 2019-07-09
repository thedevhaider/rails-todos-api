require 'rails_helper'

RSpec.describe User, type: :model do
  # Association Test
  # Ensure User has 1:m relationship with Todo
  it { should have_many(:todos) }

  # Validation Test
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:password_digest) }
  
end
