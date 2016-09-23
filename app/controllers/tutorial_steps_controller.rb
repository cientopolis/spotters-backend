class TutorialStepsController < ApplicationController
  before_action :set_tutorial_step, only: [:show, :edit, :update, :destroy]

  # GET /tutorial_steps
  # GET /tutorial_steps.json
  def index
    @tutorial_steps = TutorialStep.all
  end

  # GET /tutorial_steps/1
  # GET /tutorial_steps/1.json
  def show
  end

  # GET /tutorial_steps/new
  def new
    @tutorial_step = TutorialStep.new
  end

  # GET /tutorial_steps/1/edit
  def edit
  end

  # POST /tutorial_steps
  # POST /tutorial_steps.json
  def create
    @tutorial_step = TutorialStep.new(tutorial_step_params)

    respond_to do |format|
      if @tutorial_step.save
        format.html { redirect_to @tutorial_step, notice: 'Tutorial step was successfully created.' }
        format.json { render :show, status: :created, location: @tutorial_step }
      else
        format.html { render :new }
        format.json { render json: @tutorial_step.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tutorial_steps/1
  # PATCH/PUT /tutorial_steps/1.json
  def update
    respond_to do |format|
      if @tutorial_step.update(tutorial_step_params)
        format.html { redirect_to @tutorial_step, notice: 'Tutorial step was successfully updated.' }
        format.json { render :show, status: :ok, location: @tutorial_step }
      else
        format.html { render :edit }
        format.json { render json: @tutorial_step.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tutorial_steps/1
  # DELETE /tutorial_steps/1.json
  def destroy
    @tutorial_step.destroy
    respond_to do |format|
      format.html { redirect_to tutorial_steps_url, notice: 'Tutorial step was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tutorial_step
      @tutorial_step = TutorialStep.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tutorial_step_params
      params.require(:tutorial_step).permit(:title, :text, :position)
    end
end
