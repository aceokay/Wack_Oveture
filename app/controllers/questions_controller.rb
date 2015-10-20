class QuestionsController < ApplicationController
  def show
    @question = Question.find(params[:id])
  end

  def new
    @question = Question.new
    @tags = Tag.all
  end

  def create
    @question = current_user.questions.new(question_params)
    tag_ids = params[:question][:tag]
    if @question.save
      if tag_ids != nil
        if tag_ids.length > 0
          tag_ids.each do |tag_id|
            tag = Tag.find(tag_id)
            @question.tags.push(tag)
          end
        end
        current_user.questions.push(@question)
      end
      redirect_to home_index_path
    else
      render :new
    end
  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy
    redirect_to home_index_path
  end

  private
  def question_params
    params.require(:question).permit(:title, :body)
  end
end
