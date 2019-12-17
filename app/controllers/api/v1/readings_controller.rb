class Api::V1::ReadingsController < ApplicationController
  def index
    if logged_in
      readings = Reading.where teacher_id: @current_teacher.id
      render json: readings
    else
      render json: { errors: ["Invalid token"] }, status: :not_accepted
    end
  end

  def create
    if logged_in
      reading = Reading.create({
        teacher_id: @current_teacher.id,
        student_id: reading_params["student_id"],
        story_id: reading_params["story_id"]
      })

      if reading.valid?
        reading_params["mistakes"].each do |mistake|
          Mistake.create({
            reading_id: reading["id"],
            story_word_id: mistake["storyWordId"],
            category: mistake["category"],
            miscue: mistake["miscue"]
          })
        end
      else
        render json: { errors: reading.errors.full_messages }
      end

      render json: reading
    else
      render json: { errors: ["Invalid token"] }, status: :not_accepted
    end
  end

  private

  def reading_params
    params.require(:reading).permit(:student_id, :story_id, mistakes: [:storyWordId, :category, :miscue])
  end
end
