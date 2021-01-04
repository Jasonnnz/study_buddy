class SchoolCoursesController < ApplicationController

    def new
        @school_course = SchoolCourse.new
        @schools = School.all
        @courses = Course.all
    end

    def create 
        @school_course = SchoolCourse.create(school_course_params)
        if @school_course.valid?
            redirect_to school_path(@school_course.school)
        else
            flash[:errors] = @school_course.errors.full_messages
            redirect_to new_school_course_path
        end
    end

    private 

    def school_course_params
        params.require(:school_course).permit(:school_id, :course_id, :teacher)
    end

end
