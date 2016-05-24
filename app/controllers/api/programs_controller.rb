class API::ProgramsController < ApplicationController
  before_action :set_program, only: [:show, :update]

  def index
    @programs = Program.all
  end

  def show
  end

  def update
    if @program.update(program_params)
      head :ok
    else
      render json: @program.errors, status: 422
    end
  end

  private

  def set_program
    @program = Program.find(params[:id])
  end

  def program_params
    params.require(:program)
          .permit(:name, :description, :duration,
                  :primary_price, :secondary_price, :preview_img)
  end
end
