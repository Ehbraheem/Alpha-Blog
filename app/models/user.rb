class User < ActiveRecord::Base
  validates :username, presence: true,
            uniqueness: {case_sensitive: false},
            length: { minimum: 3, maximum: 25}

  VALID_EMAIL_REGEX = /\A[\w+\-_.]+@[a-z\d\-_.]+\.[a-z]+\z/i

  validates :email, presence: true,
            uniqueness: {case_sensitive: false},
            length: {maximum: 105},
            format: { with: VALID_EMAIL_REGEX}


  # TODO: Fix the validation to be dry
  protected # to protect against external method call
  def validation min, max

  end
  # End TODO: fix validation to be dry
end
