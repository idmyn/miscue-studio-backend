class ApplicationController < ActionController::API
  before_action :set_current_teacher

  def issue_token(payload)
    JWT.encode(payload, ENV["RAILS_SECRET"])
  end

  def decode_token(token)
    JWT.decode(token, ENV["RAILS_SECRET"])[0]
  end

  def get_token
    request.headers["Authorization"]
  end

  def set_current_teacher
    token = get_token
    if token
      decoded_token = decode_token(token)
      @current_teacher = Teacher.find(decoded_token["teacher_id"])
    else
      @current_teacher = nil
    end
  end

  def logged_in
    !!@current_teacher
  end
end
