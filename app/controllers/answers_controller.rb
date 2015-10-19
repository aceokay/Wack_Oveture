class AnswersController < ApplicationController
  def new
    @answer = Answer.new
    @question = Question.find(params[:question_id])
  end

  def create
    @answer = Answer.new(answer_params)
    @question = Question.find(params[:question_id])
    if @answer.save
      @question.answers.push(@answer)
      redirect_to home_index_path
    else
      render :new
    end
  end

  private
  def answer_params
    params.require(:answer).permit(:body)
  end
end
