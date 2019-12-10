class Api::V1::TeachersController < ApplicationController
  def show
    teacher = Teacher.find(params[:id])
    render json: teacher
  end

  def create
    teacher = Teacher.create(teacher_params)
    if teacher.valid?
      render json: teacher
    else
      render json: { errors: teacher.errors.full_messages }, status: :not_accepted
    end
  end

  private

  def teacher_params
    params.require(:teacher).permit(:email, :password, :password_confirmation)
  end
end
