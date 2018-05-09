class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :ownerships , :dependent => :delete_all
  has_many :ip_assets, through: :ownerships , :dependent => :delete_all
  has_one :faculty
accepts_nested_attributes_for :faculty
   accepts_nested_attributes_for :ownerships

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :omniauth_providers => [:google_oauth2]
  def self.from_omniauth(auth)
      where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
        user.provider = auth.provider
        user.uid = auth.uid
        user.email = auth.info.email
        user.password = Devise.friendly_token[0,20]
      end
  end
  def active_for_authentication?
        

        super && status?
      end
  def inactive_message 
    if !status? 
       :inactive
    else 
      super :is_locked
    end 
  end
end
