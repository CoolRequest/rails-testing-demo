class ToDosController < ApplicationController
  before_action :set_to_do, only: %i[ show edit update destroy ]

  # GET /to_dos
  def index
    @to_dos = ToDo.all
  end

  # GET /to_dos/1
  def show
  end

  # GET /to_dos/new
  def new
    @to_do = ToDo.new
  end

  # GET /to_dos/1/edit
  def edit
  end

  # POST /to_dos
  def create
    @to_do = ToDo.new(to_do_params)

    if @to_do.save
      redirect_to @to_do, notice: "To do was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /to_dos/1
  def update
    if @to_do.update(to_do_params)
      redirect_to @to_do, notice: "To do was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /to_dos/1
  def destroy
    @to_do.destroy
    redirect_to to_dos_url, notice: "To do was successfully destroyed."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_to_do
      @to_do = ToDo.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def to_do_params
      params.require(:to_do).permit(:title, :description, :due_date)
    end
end
