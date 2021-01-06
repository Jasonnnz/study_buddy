class SessionsController < ApplicationController
    skip_before_action :authorized_to_see_page, only: [:login, :handle_login]

    def login
        @error = flash[:login_error]
    end

    def handle_login
        @student = Student.find_by(username: params[:username])

        if @student && @student.authenticate(params[:password]) 
            session[:student_id] = @student.id
            redirect_to student_path(@student)
        else
            flash[:login_error] = "Password or Username incorrect"
            redirect_to login_path 
        end 
    end

    def logout
        session[:student_id] = nil 
        redirect_to '/'
    end
end