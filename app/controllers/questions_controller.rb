class QuestionsController < ApplicationController
  before_action :set_evaluation, only: %i(create destroy)
  before_action :set_question, except: :create

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

  def edit; end

  def update
    respond_to do |format|
      if @question.update(question_params)
        format.turbo_stream
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def show; end

  def destroy
    @question.destroy

    # ! Since I'm using the turbo_stream_from, the updates are beign doing from the action cable, we don't need to render the turbo_stream template
    # respond_to do |format|
    #   format.turbo_stream
    # end
  end

private

  def set_evaluation
    @evaluation ||= Evaluation.find_by(id: params[:evaluation_id])
  end

  def set_question
    @question ||= Question.find_by(id: params[:id])
  end

  def question_params
    params.require(:question).permit(:name, :kind)
  end
end
