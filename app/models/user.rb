class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :comments
  has_many :posts
  has_many :replies

  def to_s
		"#{firstname} #{middlename} #{lastname}"
  end

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_initialize do |user|
    user.provider = auth.provider
    user.uid = auth.uid
    user.name = auth.info.name
    user.oauth_token = auth.credentials.token
    user.oauth_expires_at = Time.at(auth.credentials.expires_at)
    user.save!
    end
  end
end
