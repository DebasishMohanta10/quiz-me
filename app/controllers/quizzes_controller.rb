class QuizzesController < ApplicationController
  before_action :authenticate_user!,except: [:index , :show]
  before_action :require_permission,only: [:edit, :update, :destroy]

  def index
    quizzes = Quiz.includes(:user).all
    respond_to do |format|
      format.html{ render :index,locals: { quizzes: quizzes } }
    end
  end

  def show
    quiz = Quiz.find(params[:id])
    respond_to do |format|
      format.html{ render :show,locals: { quiz: quiz } }
    end
  end

#  def new
#    quiz = Quiz.new
#    respond_to do |format|
#      format.html{ render :new,locals: { quiz: quiz } }
#    end
#  end

#  def create
#    quiz = Quiz.new(quiz_params)
#    respond_to do |format|
#      format.html do
#        if quiz.save
#          flash[:success] = "Quiz saved successfully."
#          redirect_to quizzes_url
#        else
#          flash.now[:error] = "Error:Something Went Wrong!"
#          render :new,locals: { quiz: quiz }
#        end
#      end
#    end
#  end
  def require_permission
    if Quiz.find(params[:id]).user != current_user
      redirect_to quizzes_url,flash: { error: "You don't have permission to do that" }
    end
  end

  def edit
    quiz = Quiz.find(params[:id])
    respond_to do |format|
      format.html{ render :edit,locals: { quiz: quiz } }
    end
  end

  def update
    quiz = Quiz.find(params[:id])
    respond_to do |format|
      format.html do
        if quiz.update(quiz_params)
          flash[:success] = "Quiz updated successfully"
          redirect_to quizzes_url
        else
          flash.now[:error] = "Error: Something went Wrong!"
          render :edit,locals: { quiz: quiz }
        end
      end
    end
  end

  def destroy
    quiz = Quiz.find(params[:id])
    quiz.destroy
    respond_to do |format|
      format.html do
        flash[:success] = "Quiz removed successfully"
        redirect_to quizzes_url
      end
    end
  end

  private
    def quiz_params
      params.require(:quiz).permit(:title,:description)
    end
end
