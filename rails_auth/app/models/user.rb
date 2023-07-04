class User < ApplicationRecord

    before_validation :ensure_session_token

    validates :username, :session_token, presence: true
    validates :username, uniqueness: true
    validates :session_token, presence: { message: "Password can't be blank"}
    validates :password, length: {minimum: 8}, allow_nil: true

    attr_accessor :password

    def self.find_by_credentials(username, password)
        user = User.find_by(username: username)
        if user && user.is_password?(password)
            return user
        else
            return nil
        end
    end

    def password=(password)
        @password = password
        self.password_digest = BCrypt::Password.create(password)
    end

    def is_password?(password)
        bcrypt_obj = BCrypt::Password.new(self.password_digest)
        bcrypt_obj.is_password?(password)
    end
    
    def reset_session_token!
        self.session_token = generate_unique_session_token
        self.save!
        return self.session_token
    end
    def ensure_session_token
        session_token ||= generate_unique_session_token
    end

    def generate_unique_session_token
        token = SecureRandom::urlsafe_base64
        while User.exists?(session_token: token)
            token = SecureRandom::urlsafe_base64
        end
        token
    end

end
