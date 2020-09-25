class OrganizationsController < ApplicationController
    def create
        @user = current_user
        @organization = @user.organizations.create(organization_params)
        redirect_to user_path(@user)
    end
    
    def edit
        @organization = Organization.find(params[:user_id])
        @user = current_user
    end
    
    def leave
        @organization = Organization.find(params[:organization_id])
        @user = current_user
        @organization.user = nil
        if @organization.save!
            redirect_to user_path(@user)
        else
            render 'edit'
        end
    end
    
    def show
        @user = current_user
        @user.organization_ids = params[:user_id]
        redirect_to user_path(@user)
    end
    
    def update
        @organization = Organization.find(params[:user_id])
        @user = current_user
        
        if @organization.update(organization_params)
            redirect_to @user
        else
            render 'edit'
        end
    end
    
    def destroy
        @organization = Organization.find(params[:user_id])
        @user = current_user
        
        @organization.destroy
        redirect_to @user
    end
    
    private
        def organization_params
            params.require(:organization).permit(:name, :hourlyrate)
        end
end
