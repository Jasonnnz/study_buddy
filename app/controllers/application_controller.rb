class ApplicationController < ActionController::Base
    before_action :authorized_to_see_page
    helper_method :logged_in?

    def authorized_to_see_page
        redirect_to login_path unless logged_in?
    end

    def logged_in?
        !set_current_student.nil?
    end

    def set_current_student
        @current_student = Student.find_by(id: session[:student_id])
    end

end
