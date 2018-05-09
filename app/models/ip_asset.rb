class IpAsset < ApplicationRecord
  validates :title, :filename, :attachment, :ownerships, presence: true  
	has_many :ownerships, :dependent => :delete_all
	has_many :users, through: :ownerships, :dependent => :delete_all
  has_many :ip_comms, :dependent => :delete_all
has_many :faculties, through: :ip_comms
	accepts_nested_attributes_for :ownerships, :reject_if => :all_blank , :allow_destroy =>true
   accepts_nested_attributes_for :users
	 mount_uploader :attachment, AttachmentUploader
	 after_create :set_ip_committee 
acts_as_taggable_on :tags
def set_ip_committee
    ip_com = User.where(:isipcomm => true)
    ip_com.each do |com|
      unless self.users.include?(com)
        self.ip_comms << IpComm.create(:user_id => com.id)
      end
    end

  end

	 
end










 

  