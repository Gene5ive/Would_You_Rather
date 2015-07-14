class QuestionsController < ApplicationController
  before_filter :authenticate_user!, except: [:index, :show]

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
    else
      render :edit
    end
    respond_to do |format|
      format.html { redirect_to questions_path }
      format.js
    end
  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy
    flash[:notice] = "Question removed"
    redirect_to questions_path
  end

  def upvote
    @question = Question.find(params[:id])
    @question.upvote_by current_user
    respond_to do |format|
      format.js
    end
  end

  def downvote
    @question = Question.find(params[:id])
    @question.downvote_by current_user
    respond_to do |format|
      format.js
    end
  end

  private
  def question_params
    params.require(:question).permit(:option_one, :option_two, :image_one, :image_two, :option_one_votes, :option_two_votes)
  end
end
