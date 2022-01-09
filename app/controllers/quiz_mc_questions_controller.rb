class QuizMcQuestionsController < ApplicationController
  before_action :authenticate_user!
  before_action :require_permission,only: [:new, :create]
  def index
    quiz = Quiz.includes(:mc_questions).find(params[:id])
    respond_to do |format|
      format.html { render :index,locals: { quiz: quiz,questions: quiz.mc_questions } }
    end
  end

  def new
    quiz = Quiz.find(params[:id])
    respond_to do |format|
      format.html{ render :new,locals: { quiz: quiz,question: quiz.mc_questions.build } }
    end
  end

  def create
    quiz = Quiz.find(params[:id])
    question = quiz.mc_questions.build(question_params)

    respond_to do |format|
      format.html do
        if question.save
          flash[:success] = "Question saved successfully"
          redirect_to quiz_mc_questions_url
        else
          flash.now[:error] = "Something Went Wrong"
          render :new,locals: { quiz: quiz,question: quiz.mc_questions.build }
        end
      end
    end
  end

  def require_permission
    if Quiz.find(params[:id]).user != current_user
      redirect_to quizzes_url,flash: { error: "You don't have permission to do that" }
    end
  end


  private
    def question_params
      params.require(:mc_question).permit(:question,:answer,:distractor_1,:distractor_2)
    end
end
