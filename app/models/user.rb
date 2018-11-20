class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, 
         :recoverable, :rememberable, :trackable, :validatable
#	after_create :assign_role
  
  resourcify
  rolify 

  has_many :projects,dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :invitable, :database_authenticatable, :confirmable, 
         :recoverable, :rememberable, :trackable, :validatable

   #       def admin?
  	# 		has_role?(:admin)
		 # end
		 #add role :member to invited user
		#  def assign_role
		#  	if current_user.has_role? :admin
		#  		self.add_role(:member)
		#  end

		# end
end
