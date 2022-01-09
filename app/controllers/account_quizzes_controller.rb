class AccountQuizzesController < ApplicationController
  before_action :authenticate_user!

  def index
    quizzes = current_user.quizzes

    respond_to do |format|
      format.html{ render :index,locals: { quizzes: quizzes } }
    end
  end

  def new
    # make empty quiz object
    quiz = Quiz.new
    # display new view
    respond_to do |format|
      format.html { render :new, locals: { quiz: quiz } }
    end
  end

  def create
    # new object from params
    quiz = current_user.quizzes.build(quiz_params)
    # respond_to block
    respond_to do |format|
      format.html do
        if quiz.save
          # success message
          flash[:success] = "Quiz saved successfully"
          # redirect to index
          redirect_to account_quizzes_url
        else
          # error message
          flash.now[:error] = "Error: Quiz could not be saved"
          # render new
          render :new, locals: { quiz: quiz }
        end
      end
    end
  end

  private
    def quiz_params
      params.require(:quiz).permit(:title,:description)
    end
end
