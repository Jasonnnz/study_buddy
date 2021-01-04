class CoursesController < ApplicationController

    before_action :find_course, only: [:show, :edit, :update, :destroy]
    
    def index
        @courses = Course.all
    end
    
    def show
        @school_course = SchoolCourse.new
    end

    def new
        @course = Course.new
    end

    def create
        @course = Course.create(course_params)
        if @course.valid?
            redirect_to course_path(@course)
        else
            flash[:errors] = @course.errors.full_messages
            redirect_to new_course_path 
        end
    end

    def edit
    end

    def update 
        if @course.update(course_params)
            redirect_to course_path(@course)
        else
            flash[:errors] = @course.errors.full_messages
            redirect_to edit_course_path
        end
    end

    def destroy
        @course.destroy 
        redirect_to courses_path
    end

    private

    def find_course
        @course = Course.find(params[:id])
    end

    def course_params
        params.require(:course).permit(:name)
    end

end
