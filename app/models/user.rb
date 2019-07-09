class User < ApplicationRecord
    # Secure Password
    has_secure_password

    # Association
    has_many :todos, foreign_key: "created_by"

    # Validations
    validates_presence_of :name, :email, :password_digest
end
