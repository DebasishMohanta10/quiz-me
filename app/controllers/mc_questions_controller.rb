class McQuestionsController < ApplicationController
  before_action :authenticate_user!,except: [:show]
  before_action :require_permission,only: [:edit, :update , :destroy]

  def index
    questions = McQuestion.all
    respond_to do |format|
      format.html{ render :index,locals: { questions: questions } }
    end
  end

  def show
    question = McQuestion.find(params[:id])
    respond_to do |format|
      format.html{ render :show,locals: { question: question } }
    end
  end

  def new
    question = McQuestion.new
    respond_to do |format|
      format.html { render :new,locals: { question: question } }
    end
  end

  def create
    question = McQuestion.new(question_params)
    respond_to do |format|
      format.html do
        #if question saves
        if question.save
          #success message
          flash[:success] = "Question saved successfully."
          #redirect to index
          redirect_to mc_questions_url
        #else
        else
          #error message
          flash.now[:error] = "Error: Question could not be saved."
          #render new
          render :new,locals: { question: question }
        end
      end
    end
  end

  def edit
    question = McQuestion.find(params[:id])
    respond_to do |format|
      format.html{ render :edit,locals: { question: question } }
    end
  end

  def update
    question = McQuestion.find(params[:id])
    respond_to do |format|
      format.html do
        if question.update(question_params)
          flash[:success] = "Question Updated successfully"
          redirect_to quiz_url(question.quiz)
        else
          flash.now[:error] = "Error: Something Went Wrong"
          render :edit,locals: { question: question }
        end
      end
    end
  end

  def destroy
    question = McQuestion.find(params[:id])
    question.destroy
    respond_to do |format|
      format.html do
        flash[:success] = "Question removed successfully"
        redirect_to quiz_url(question.quiz)
      end
    end
  end

  def require_permission
    quiz = McQuestion.find(params[:id]).quiz

    if quiz.user != current_user
      redirect_to quiz_path(quiz),flash: { error: "You don't have permission to do that." }
    end
  end

  private
    def question_params
      params.require(:mc_question).permit(:question,:answer,:distractor_1,:distractor_2)
    end
end
