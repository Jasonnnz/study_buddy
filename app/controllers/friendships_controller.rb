class FriendshipsController < ApplicationController

    def create
        Friendship.create(follower_id: @current_student.id, followee_id: params[:followee_id])
        redirect_to student_path(@current_student)
    end

    def destroy
        @friendship = Friendship.find(params[:id])
        @friendship.destroy 
        redirect_to student_path(@current_student)
    end

end
