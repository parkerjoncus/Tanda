class OrganizationsController < ApplicationController
    def create
        @user = User.find(params[:user_id])
        @organization = @user.organizations.create(organization_params)
        redirect_to user_path(@user)
    end
    
    private
        def organization_params
            params.require(:organization).permit(:name, :hourlyrate)
        end
end
