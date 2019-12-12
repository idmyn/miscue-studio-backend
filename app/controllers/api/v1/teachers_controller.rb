class Api::V1::TeachersController < ApplicationController
  def show
    teacher = Teacher.find(params[:id])
    render json: teacher
  end

  def create
    teacher = Teacher.create(teacher_params)
    if teacher.valid?
      render json: { teacher: TeacherSerializer.new(teacher), token: issue_token(teacher_id: teacher.id) }
    else
      render json: { errors: teacher.errors.full_messages }, status: :not_accepted
    end
  end

  def login
    teacher = Teacher.find_by(email: login_params[:email])
    if teacher&.authenticate(login_params[:password])
      render json: { teacher: TeacherSerializer.new(teacher), token: issue_token(teacher_id: teacher.id) }
    else
      render json: { errors: ["Email or password incorrect."] }
    end
  end

  def validate
    if logged_in
      render json: { teacher: TeacherSerializer.new(@current_teacher), token: issue_token(teacher_id: @current_teacher.id) }
    else
      render json: { errors: ["Invalid token"] }, status: :not_accepted
    end
  end

  private

  def teacher_params
    params.require(:teacher).permit(:email, :password, :password_confirmation)
  end

  def login_params
    params.require(:teacher).permit(:email, :password)
  end
end
