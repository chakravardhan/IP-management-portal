class Faculty < ApplicationRecord
	belongs_to :user
	accepts_nested_attributes_for :user, :reject_if => :all_blank, :allow_destroy =>true
end
