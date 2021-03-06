class User < ActiveRecord::Base
  has_many :stories
  has_many :votes
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,:omniauthable

  def self.twitter_auth(response)
    credentials = { uid: response[:uid], provider: :twitter}
    pwd = Devise.friendly_token[0,20]

    User.find_or_create_by(credentials) do |user| 
      user.name = response[:info][:name]
      user.password = pwd
      user.password_confirmation = pwd
    end
  end

  def email_required?
    return false if provider == "twitter"
    super
  end

end
