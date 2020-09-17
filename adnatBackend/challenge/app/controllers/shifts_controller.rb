class ShiftsController < ApplicationController
    def new
        @user = User.find(params[:user_id])
        @users = User.all
        @shift = Shift.new
    end
    
    def create
        @user = User.find(params[:user_id])
        shiftData = params[:shift]
        start = DateTime.new shiftData["date(1i)"].to_i, shiftData["date(2i)"].to_i, shiftData["date(3i)"].to_i, shiftData["start(4i)"].to_i, shiftData["start(5i)"].to_i
        finish = DateTime.new shiftData["date(1i)"].to_i, shiftData["date(2i)"].to_i, shiftData["date(3i)"].to_i, shiftData["finish(4i)"].to_i, shiftData["finish(5i)"].to_i
        params[:shift]["start"] = start
        params[:shift]["finish"] = finish
        @shift = @user.shifts.create(shift_params)
        redirect_to user_path(@user)
    end
    
    private
        def shift_params
            params.require(:shift).permit(:start, :finish, :breaklength)
        end
end
