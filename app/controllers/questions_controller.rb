class QuestionsController < ApplicationController
  before_action :set_evaluation, only: :create

  def create
    @question = @evaluation.questions.build(question_params)

    respond_to do |format|
      if @question.save
        format.turbo_stream
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

private

  def set_evaluation
    @evaluation ||= Evaluation.find_by(id: params[:evaluation_id])
  end

  def question_params
    params.require(:question).permit(:name, :kind)
  end
end
