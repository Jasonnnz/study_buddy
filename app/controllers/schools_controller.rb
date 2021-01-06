class SchoolsController < ApplicationController
    skip_before_action :authorized_to_see_page, only: [:index, :show]
    before_action :find_school, only: [:show, :edit, :update, :destroy]
    
    def index
        @schools = School.all
    end
    
    def show
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
        params.require(:school).permit(:name, :location)
    end

end
