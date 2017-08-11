class WorkoutsController < ApplicationController
  skip_before_action :authenticate_user!

  def show
    @tabata = ExercisesAggregator.new(params).generate_tabata
  end
end
