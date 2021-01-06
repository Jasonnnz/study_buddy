class StudentCoursesController < ApplicationController

    def new
        @student_course = StudentCourse.new
        @students = Student.all 
        @courses = Course.all
        redirect_to student_path(@current_student)
    end

    def create 
        @student_course = @current_student.student_courses.create(student_course_params)
        if @student_course.valid?
            redirect_to student_path(@current_student)
        else
            flash[:errors] = @student_course.errors.full_messages
            redirect_to school_path(@current_student.school.id)
        end
    end

    def edit
        @student_course = StudentCourse.find(params[:id])
    end

    def update
        @student_course = StudentCourse.find(params[:id])
        if @student_course.update(student_course_params)
            redirect_to student_path(@current_student)
        else
            flash[:errors] = @student_course.errors.full_messages
            redirect_to edit_student_course_path
        end
    end

    def destroy
        @student_course = StudentCourse.find(params[:id])
        @student_course.destroy 
        redirect_to student_path(@current_student)
    end

    private 

    def student_course_params
        params.require(:student_course).permit(:student_id, :course_id, :completed, :grade, :school_course_id)
    end


end
