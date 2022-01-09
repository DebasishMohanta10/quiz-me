class StaticPagesController < ApplicationController
  def welcome
    respond_to do |format|
      format.html { render :welcome }
    end
  end

  def about
    respond_to do |format|
      format.html { render :about }
    end
  end

  def leave_feedback
    required = [:name ,:email , :reply, :feedback_type,:message ]
    form_complete = true
    required.each do |f|
      if params.has_key?(f) and not params[f].blank?
        #that's good news. do nothing
      else
        form_complete = false
      end
    end

    if form_complete
      form_status_msg = "Thanks for your feedback!"
    else
      form_status_msg = "Please fill in all the remaining form fields and resubmit."
    end

    respond_to do |format|
      format.html do
        flash.now[:status_msg] = form_status_msg
        render :contact, locals: { feedback: params }
      end
    end

  end

end
