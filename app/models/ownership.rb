class Ownership < ApplicationRecord
	belongs_to :user
	belongs_to :ip_asset
	accepts_nested_attributes_for :user, :reject_if => :all_blank, :allow_destroy =>true
end
