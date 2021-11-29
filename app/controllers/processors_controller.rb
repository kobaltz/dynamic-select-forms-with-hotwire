class ProcessorsController < ApplicationController
  before_action :set_processor, only: %i[ show edit update destroy ]

  # GET /processors
  def index
    @processors = Processor.includes(:brand, :generation).all
  end

  # GET /processors/1
  def show
  end

  # GET /processors/new
  def new
    @processor = Processor.new
  end

  # GET /processors/1/edit
  def edit
  end

  # POST /processors
  def create
    @processor = Processor.new(processor_params)

    if @processor.save
      redirect_to @processor, notice: "Processor was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /processors/1
  def update
    if @processor.update(processor_params)
      redirect_to @processor, notice: "Processor was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /processors/1
  def destroy
    @processor.destroy
    redirect_to processors_url, notice: "Processor was successfully destroyed.", status: :see_other
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_processor
      @processor = Processor.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def processor_params
      params.require(:processor).permit(:brand_id, :generation_id, :name, :cores)
    end
end
