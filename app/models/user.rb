class User < ActiveRecord::Base
  devise :omniauthable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :name, presence: true, length: { maximum: 255 }
  validates :email, presence: true, length: { maximum: 255 }
  has_many :tweets

	def self.find_for_google_oauth2(access_token, signed_in_resource=nil)
    data = access_token.info
    user = User.where(provider: access_token.provider, uid: access_token.uid).first
    return user if user
    registered_user = User.where(email: data["email"]).first
    if registered_user
      registered_user.image = data["image"]
      registered_user.save
      return registered_user
    else
      user = User.create(
        email: data["email"],
        name: data["name"],
        image: data["image"],
        provider: access_token.provider,
        uid: access_token.uid,
        password: Devise.friendly_token[0,20]
      )
    end

	end

  def self.domain_valid?(email)
    email.end_with?("@moip.com.br")
  end

end
