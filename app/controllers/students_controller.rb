class StudentsController < ApplicationController
    skip_before_action :authorized_to_see_page, only: [:new, :create]
    before_action :find_student, only: [:show, :edit, :update, :destroy]

    def index
        @students = Student.all
    end
    
    def show
        # @teacher = @current_student.courses.
    end

    def new
        @student = Student.new
        @schools = School.all
    end

    def create
        @student = Student.create(student_params)
        if @student.valid?
            session[:student_id] = @student.id 
            redirect_to student_path(@student)
        else 
            flash[:errors] = @student.errors.full_messages
            redirect_to new_student_path
        end
    end

    def edit
        @schools = School.all
    end

    def update 
        if @student.update(student_params)
            redirect_to student_path(@student)
        else
            flash[:errors] = @student.errors.full_messages
            redirect_to edit_student_path
        end
    end

    def destroy
        @student.destroy 
        redirect_to students_path
    end

    private

    def find_student
        @student = Student.find(params[:id])
    end

    def student_params
        params.require(:student).permit(:name, :username, :password, :email, :img_url, :school_id)
    end
end
