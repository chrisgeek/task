class Project < ApplicationRecord

	belongs_to :user
	has_many :gigs,dependent: :destroy
	
	resourcify

	extend FriendlyId
	friendly_id :name, use: :slugged

	validates :name, presence:true
	validates :team, presence:true
end