class Gig < ApplicationRecord
  belongs_to :project

  	resourcify
  	
	extend FriendlyId
	friendly_id :name, use: :slugged

	validates :name, presence:true
	validates :description, presence:true
	#validates :timeline, presence:true
end
