VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
VALID_PASSWORD_REGEX = /[\w]+/i

class User < ApplicationRecord
    before_save { self.email = email.downcase }
    validates(:name, presence: true, length: {maximum: 25})
    validates(:email, presence: true, length: {maximum: 100}, format: {with: VALID_EMAIL_REGEX}, uniqueness: { case_sensitive: false })

    has_secure_password
    validates :password, presence: true, length: { minimum: 6 }, format: {with: VALID_PASSWORD_REGEX}
end
