class InvitationsController < Devise::InvitationsController
	before_action :is_owner, only: [:create, :new]
   
   def is_owner
   		if cannot?( :invite, User )
       raise CanCan::AccessDenied
   end
end
end