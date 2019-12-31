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

    readings = student.readings.map do |reading|
      {
        id: reading.id,
        date: reading.date,
        story: {
          id: reading.story.id,
          title: reading.story.title,
          author: reading.story.author
        }
      }
    end

    words = student.words.uniq.map do |word|
      { id: word.id, content: word.content }
    end

    render json: {
      id: student.id,
      name: student.name,
      readings: readings,
      words: words
    }
  end

  def create
    student = Student.new(student_params)
    logged_in && student.teacher_id = @current_teacher.id
    student.save
    if student.valid?
      render json: student
    else
      render json: { errors: student.errors.full_messages }
    end
  end

  private

  def student_params
    params.require(:student).permit(:name)
  end
end
