class OptionsController < ApplicationController
  before_action :set_option, only: %i(edit update show destroy)
  before_action :set_question, only: :create

  def create
    @option = @question.options.build(option_params)

    respond_to do |format|
      if @option.save
        format.turbo_stream
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def edit; end

  def update
    respond_to do |format|
      if @option.update(option_params)
        format.turbo_stream
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @option.destroy

    respond_to do |format|
      format.turbo_stream
    end
  end

private

  def set_option
    @option = Option.find_by(id: params[:id])
  end

  def set_question
    @question = Question.find_by(id: params[:question_id])
  end

  def option_params
    params.require(:option).permit(:name)
  end
end
