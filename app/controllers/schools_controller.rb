class SchoolsController < ApplicationController
    skip_before_action :authorized_to_see_page, only: [:index, :show]
    before_action :find_school, only: [:show, :edit, :update, :destroy]
    
    def index
        if logged_in?
            @current_student = Student.find(session[:student_id])
        end
        if params[:search] 
            @schools = School.search(params[:search])
            flash[:error] = ""
            if @schools.count == 0
                flash[:error] = "Could not find a School with that name"
                @schools = School.all
            else
                @schools
            end
        else
            flash[:error] = ""
            @schools = School.all
        end
        # if params[:search]
        #     @schools = School.search(params[:search])
        #     flash[:error] = ""
        #     if @schools.nil? || @schools.count == School.all.count 
        #         flash[:error] = "Could not find a school with that name"
        #         @schools = School.all
        #     end
        # else
        #     flash[:error] = ""
        #     @schools = School.all 
        # end
    end
    
    def show
        if logged_in?
            @current_student = Student.find(session[:student_id])
        end
        @student_course = StudentCourse.new 
    end

    def new
        @school = School.new
    end

    def create
        @school = School.create(school_params)
        if @school.valid?
            redirect_to school_path(@school)
        else
            flash[:errors] = @school.errors.full_messages
            redirect_to new_school_path 
        end
    end

    def edit
    end

    def update 
        if @school.update(school_params)
            redirect_to school_path(@school)
        else
            flash[:errors] = @school.errors.full_messages
            redirect_to edit_school_path
        end
    end

    def destroy
        @school.destroy 
        redirect_to schools_path
    end

    private

    def find_school
        @school = School.find(params[:id])
    end

    def school_params
        params.require(:school).permit(:name, :location, :search)
    end

end
