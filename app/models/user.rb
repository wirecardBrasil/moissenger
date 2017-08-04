class User < ActiveRecord::Base
  devise :omniauthable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :name, presence: true, length: { maximum: 255 }
  validates :email, presence: true, length: { maximum: 255 }
  has_many :tweets

	def self.find_for_google_oauth2(access_token, signed_in_resource=nil)
    data = access_token.info
    user = User.where(provider: access_token.provider, uid: access_token.uid).first
    return user if user.present?
    Rails.logger.info "-----------------> #{user.inspect}"
    registered_user = User.where(email: data["email"]).first
    Rails.logger.info "=================> #{registered_user.inspect}"
    if registered_user
      registered_user.save
      return registered_user
    else
      user = User.create(
        email: data["email"],
        name: data["name"],
        user_name: data["email"].split('@')[0],
        department: "MOIP",
        about: "",
        provider: access_token.provider,
        uid: access_token.uid,
        password: Devise.friendly_token[0,20]
      )
    end
    return user

	end

  def self.domain_valid?(email)
    email.end_with?("@moip.com.br")
  end

end
