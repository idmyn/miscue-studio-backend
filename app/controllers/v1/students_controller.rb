class V1::StudentsController < ApplicationController
  def index
    if logged_in
      students = Student.where teacher_id: @current_teacher.id
      render json: students
    else
      render json: { errors: ["Invalid token"] }, status: :not_accepted
    end
  end

  def show
    student = Student.find(params[:id])
    render json: student
  end
end
