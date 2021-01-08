class StudentsController < ApplicationController
    skip_before_action :authorized_to_see_page, only: [:new, :create]
    before_action :find_student, only: [:show, :edit, :update, :destroy]

    def index
        
        if params[:search] 
            @students = Student.search(params[:search])
            flash[:error] = ""
            if @students.count == 0
                flash[:error] = "Could not find a student with that name"
                @students = Student.all
            else
                @students
            end
        else
            @students = Student.all
        end
        # if params[:search] 
        #     @students = Student.search(params[:search])
        #     if @students.nil? || @students.count == Student.all.count
        #         flash[:error] = "Could not find a student with that name"
        #         @students = Student.all
        #     end
        # else
        #     @students = Student.all
        # end
    end
    
    def show
        @friendship = Friendship.find_by(follower_id: @current_student.id, followee_id: @student.id)
    end

    def new
        @student = Student.new
        @schools = School.all
    end

    def create
        @student = Student.create(student_params)
        if @student.valid? && @student.password == @student.password_confirmation
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
        # session[:old_school_id] = @student.school.id
        # @old_school = School.find(session[:old_school_id])
        if @student.update(student_params) && @student.password == @student.password_confirmation
            if @student.school.id != params[:school_id]  
                @student.student_courses.each do |sc|
                    if sc.student.school != params[:school_id] && !sc.completed
                        sc.destroy
                    end
                end
            end
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
        params.require(:student).permit(:name, :username, :password, :email, :img_url, :school_id, :password_confirmation, :search)
    end
end
