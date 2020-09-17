class OrganizationsController < ApplicationController
    def create
        @user = User.find(params[:user_id])
        @organization = @user.organizations.create(organization_params)
        redirect_to user_path(@user)
    end
    
    def edit
        @organization = Organization.find(params[:user_id])
        @user = User.find(params[:id])
    end
    
    def show
        @user = User.find(params[:id])
        @user.organization_ids = params[:user_id]
        redirect_to user_path(@user)
    end
    
    def update
        @organization = Organization.find(params[:user_id])
        @user = User.find(params[:id])
        
        if @organization.update(organization_params)
            redirect_to @user
        else
            render 'edit'
        end
    end
    
    def destroy
        @organization = Organization.find(params[:user_id])
        @user = User.find(params[:id])
        
        @organization.destroy
        redirect_to @user
    end
    
    private
        def organization_params
            params.require(:organization).permit(:name, :hourlyrate)
        end
end
