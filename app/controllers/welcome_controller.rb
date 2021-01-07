class WelcomeController < ApplicationController

    skip_before_action :authorized_to_see_page, only: [:index]
    
    def index
        if logged_in?
            @current_student = Student.find(session[:student_id])
        end
    end

end