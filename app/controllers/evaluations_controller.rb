class EvaluationsController < ApplicationController
  before_action :set_evaluation, only: %i(show edit update destroy)

  # GET /evaluations or /evaluations.json
  def index
    @evaluations = Evaluation.all
  end

  # GET /evaluations/1 or /evaluations/1.json
  def show; end

  # GET /evaluations/new
  def new
    @evaluation = Evaluation.new
  end

  # GET /evaluations/1/edit
  def edit; end

  # POST /evaluations or /evaluations.json
  def create
    @evaluation = current_user.evaluations.build(evaluation_params)

    respond_to do |format|
      if @evaluation.save
        format.turbo_stream do
          render turbo_stream: turbo_stream.replace('evaluations_all',
                                                    partial: 'evaluations/evaluations',
                                                    locals: { evaluations: Evaluation.all })
        end
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /evaluations/1 or /evaluations/1.json
  def update
    respond_to do |format|
      if @evaluation.update(evaluation_params)
        format.html do
          redirect_to evaluation_url(@evaluation), notice: 'Evaluation was successfully updated.'
        end
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /evaluations/1 or /evaluations/1.json
  def destroy
    @evaluation.destroy!

    respond_to do |format|
      format.html { redirect_to evaluations_url, notice: 'Evaluation was successfully destroyed.' }
    end
  end

private

  def set_evaluation
    @evaluation = Evaluation.find(params[:id])
  end

  def evaluation_params
    params.require(:evaluation).permit(:name, :description)
  end
end
