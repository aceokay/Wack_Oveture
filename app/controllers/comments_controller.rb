class CommentsController < ApplicationController
  def new
    @comment = Comment.new
    if params[:question_id]
      @item = Question.find(params[:question_id])
    elsif params[:answer_id]
      @item = Answer.find(params[:answer_id])
    end
  end

  def create
    @question = Question.find(params[:question_id])
    @comment = @question.comments.new(comment_params)
    @comment.user = current_user
    if @comment
      redirect_to question_path(@question)
    else
      render :new
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:body)
  end
end
