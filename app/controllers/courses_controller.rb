class CoursesController < ApplicationController
    skip_before_action :authorized_to_see_page, only: [:index, :show]
    before_action :find_course, only: [:show, :edit, :update, :destroy]
    
    def index
        if logged_in?
            @current_student = Student.find(session[:student_id])
        end
        if params[:search] 
            @courses = Course.search(params[:search])
            flash[:error] = ""
            if @courses.count == 0
                flash[:error] = "Could not find a Course with that name"
                @courses = Course.all
            else
                @courses
            end
        else
            flash[:error] = ""
            @courses = Course.all
        end
        # if params[:search] 
        #     @courses = Course.search(params[:search])
        #     flash[:error] = ""
        #     if @courses.nil? || @courses.count == Course.all.count
        #         flash[:error] = "Could not find a course with that name"
        #         @courses = Course.all
        #     end
        # else
        #     flash[:error] = ""
        #     @courses = Course.all
        # end
    end
    
    def show
        if logged_in?
            @current_student = Student.find(session[:student_id])
        end
        @school_course = SchoolCourse.new
        session[:course_id] = params[:id]
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
        params.require(:course).permit(:name, :search)
    end

end
