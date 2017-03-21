class ExercisesController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @exercises = Exercise.all
  end

  def show
    @exercise = Exercise.find(params[:id])
  end

  def new
    @exercise = Exercise.new
  end

  def create
    @exercise = Exercise.new(exercise_params)
    if @exercise.save
      # @exercise.equipment == "Aucun" ? @exercise.initial_status = 1 : @exercise.initial_status = 0
      # @exercise.available = @exercise.initial_status
      redirect_to exercise_path(@exercise)
    else
      render :new
    end
  end

  def edit
    @exercise = Exercise.find(params[:id])
  end

  def update
    @exercise = Exercise.find(params[:id])
    if @exercise.update(exercise_params)
      redirect_to exercise_path(@exercise)
    else
      render :edit
    end
  end

  def destroy
    @exercise = Exercise.find(params[:id])
    @exercise.destroy
    redirect_to exercises_path
  end

  private

  def exercise_params
    params.require(:exercise).permit(:name, :exercise_type, :equipment)
  end
end
