class QuizController < ApplicationController
  helper_method :quiz_answer_request
  respond_to :json

  skip_before_filter :verify_authenticity_token, :only => [:answer]

  def answer
    if quiz_answer_request.invalid?
      render json: { errors: quiz_answer_request.errors.full_messages }, status: :error
      return
    end

    message = ''

    @answer = params[:answer]
    @task = Task.find params[:task_id]
    if convert(@task.answer) == convert(@answer)
      ActiveRecord::Base.transaction do
        t = Task.find_by(answered: false, id: params[:task_id])
        if t
          t.update_attributes(answered: true, user_id: user.id)
          user.increment! :rating, 1
          user.update_attributes(winner: true, win_at: Time.zone.now) if user.win?
          message = 'Correct'
        else
          message = 'Task is expired'
        end
      end
    else
      message = 'Wrong'
    end

    render json: { message: message }, status: :ok
  end

  def user
    @user||= quiz_answer_request.user
  end

  def task
    @task ||= quiz_answer_request.task
  end

  def quiz_answer_request
    @quiz_answer_request ||= QuizAnswerRequest.new(request_params)
  end

  def request_params
    params.slice(:token, :task_id, :answer)
  end

  def convert(string)
    string.mb_chars.downcase.normalize.squish.gsub(/\p{P}/, '').to_s
  end

end
