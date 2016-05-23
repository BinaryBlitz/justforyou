class Api::ProgramsController < ApplicationController
  before_action :find_program, only: [:show, :update, :destroy]

  def index
    @programs = Program.all
  end

  def show
  end

  def create
    @program = Program.new(program_params)
    if @program.save
      render status: :created
    else
      render json: @program.errors, status: 422
    end
  end

  def update
    if @program.update(program_params)
      head :ok
    else
      render json: @program.errors, status: 422
    end
  end

  def destroy
    @program.destroy
    head :no_content
  end

  private

  def find_program
    @program = Program.find(params[:id])
  end

  def program_params
    params.require(:program).permit(:name, :description, :duration, :primary_price, :secondary_price, :preview_img)
  end
end
