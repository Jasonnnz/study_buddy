class StudentCoursesController < ApplicationController

    def new
        @student_course = StudentCourse.new
        @students = Student.all 
        @courses = Course.all 
    end

    def create
        student_course_params = params.require(:student_course).permit(:student_id, :completed, :grade, :course_id) 
        @student_course = @current_student.student_courses.create(student_course_params)
        if @student_course.valid?
            redirect_to student_path(@current_student)
        else
            flash[:errors] = @student_course.errors.full_messages
            redirect_to new_student_course_path
        end
    end

    # private 

    # def student_course_params
    #     params.require(:student_course).permit(:student_id, :course_id, :completed, :grade)
    # end

    # class FavoritesController < ApplicationController

    #     def index   
    #         @favorites = @current_student.favorites
    #     end
    
    #     def new
    #         @favorite = Favorite.new
    #         @students = Student.all
    #         @words = Word.all - @current_student.words
    #     end
    
    #     def create
    #         # byebug
    #         favorite_params = params.require(:favorite).permit(:priority_level, :word_id)
    
    #         @favorite = @current_student.favorites.create(favorite_params)
    #         # student = Student.find(params[:favorite][:student_id])
    #         redirect_to student_path(@current_student)
    #     end
    
    # end

end
