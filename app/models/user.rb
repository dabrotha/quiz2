class User < ApplicationRecord
    has_secure_password

    validates(
        :email,
        presence: true,
        uniqueness: true,
        # format: VALID_EMAIL_REGEX
      )
    
      def full_name
        first_name + " " + last_name
      end


end
