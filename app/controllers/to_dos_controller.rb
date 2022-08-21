class ToDosController < ApplicationController
  before_action :set_to_do, only: %i[ show edit update destroy export ]

  def index
    @to_dos = ToDo.all
  end

  def show
  end

  def new
    @to_do = ToDo.new
  end

  def edit
  end

  def create
    @to_do = ToDo.new(to_do_params)

    if @to_do.save
      redirect_to @to_do, notice: "To do was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @to_do.update(to_do_params)
      redirect_to @to_do, notice: "To do was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @to_do.destroy
    redirect_to to_dos_url, notice: "To do was successfully destroyed."
  end

  def export
    ExportToDoJob.perform_later(@to_do)
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
