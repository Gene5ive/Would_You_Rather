class QuestionsController < ApplicationController
  def index
    @questions = Question.all
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
    if @question.save
      flash[:notice] = "Question successfully added."
    else
      flash[:notice] = "Errors."
      redirect_to new_question_path
    end
    respond_to do |format|
      format.html { redirect_to questions_path }
      format.js
    end
  end

  def edit
    @question = Question.find(params[:id])
  end

  def update
    @question = Question.find(params[:id])
    if @question.update(question_params)
      flash[:notice] = "Question successfully edited."
      redirect_to questions_path
    else
      render :edit
    end
  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy
    flash[:notice] = "Question removed"
    redirect_to questions_path
  end

  private
  def question_params
    params.require(:question).permit(:option_one, :option_two, :option_one_votes, :option_two_votes)
  end
end
