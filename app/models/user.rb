class User < ApplicationRecord
  before_save :downcase_email

  validates :email, presence: true,
    length: {minimum: Settings.minimum_email, maximum: Settings.maximum_email},
    format: {with: Settings.valid_email_regex},
    uniqueness: {case_sensitive: false}
  validates :name, presence: true, length: {maximum: Settings.maximum_name}
  validates :password, presence: true,
    length: {minimum: Settings.minimum_pass},
    if: :password

  has_secure_password

  private
  def downcase_email
    email.downcase!
  end
end
