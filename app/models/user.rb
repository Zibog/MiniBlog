class User < ApplicationRecord
    attr_accessor :remember_token, :activation_token

    before_create :create_activation_digest
    before_save :downcase_email
    validates :name, presence: true, length: { maximum: 50 }
    validates :email, presence: true, length: { maximum: 255 }, format: { with: URI::MailTo::EMAIL_REGEXP },
                uniqueness: { case_sensitive: false }
    has_secure_password
    
    # Тут я вообще сломал себе голову, а потом придумал. Можем позволить себе пустой пароль
    # (для редактирования). При создании же новых пользователей пустой пароль не пройдёт
    # за счёт проверки в has_secure_password
    validates :password, presence: true, length: { minimum: 8 }, allow_nil: true

    has_many :posts, dependent: :destroy

    # Returns digest of the string
    def User.digest(string)
        cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
        BCrypt::Password.create(string, cost: cost)
    end

    # Returs random token
    def User.new_token
        SecureRandom.urlsafe_base64
    end

    def remember
        self.remember_token = User.new_token
        update_attribute(:remember_digest, User.digest(remember_token))
    end

    def authenticated?(remember_token)
        return false if remember_digest.nil?
        BCrypt::Password.new(remember_digest).is_password?(remember_token)
    end

    # Forgets the user
    def forget
        update_attribute(:remember_digest, nil)
    end

    # Defines a feed
    def feed
        Post.where("user_id = ?", id)
    end

    private

    # Converts email to downcase
    def downcase_email
        self.email = email.downcase
    end

    # Creates and assigns the activation token and digest
    def create_activation_digest
        self.activation_token = User.new_token
        self.activation_digest = User.digest(activation_token)
    end
end
