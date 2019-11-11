class PurchasePolicy < ApplicationPolicy  

    def submit?
        user.role? :admin or user.role? :client
    end

    def destroy?
        user.role? :admin
    end

    def close?
        user.role? :admin
    end	

    def reject?
        user.role? :admin
    end	
	

end  