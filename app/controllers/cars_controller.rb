class CarsController < ApplicationController
  before_action :set_article, only: [:show,:update, :destroy, :edit ]
  def index
    @cars = Car.all
  end

  def show
  end

  def edit
  end

  def new
    @car = Car.new
  end

  def create
    @car = Car.new(car_params)
    if @car.save!
    flash[:notice] = "Created car successfully"
    redirect_to @car
    else
      render 'new', status: :unprocessable_entity
    end
  end
  def update
    if @car.update!(car_params)
      flash[:notice] = "Updated car successfully"
      redirect_to @car
    else
      render 'edit', status: :unprocessable_entity
    end

  end

  def destroy
    @car.destroy!
    redirect_to cars_path
  end

  private

  def set_article
    @car = Car.find(params[:id])
  end

  def car_params
    params.require(:car).permit(:make,:model, :year, :price)
  end

end
