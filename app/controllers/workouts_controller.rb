class WorkoutsController < ApplicationController
  skip_before_action :authenticate_user!

  def show
    @tabatas = TabataService.new(params[:query]).aggregated_exos
#     exercises_available
#     tabata_cardio
#     # # @cardio_exercises = exos_generator('Cardio')
#     # @abdos_exercises = exos_generator('Abdos')
#     # @pecs_exercises = exos_generator('Pecs')
#     # @back_exercises = exos_generator('Dos')
#     # @tris_and_epaules_exercises = exos_generator('Tris') + exos_generator('Epaules')
#     # # @tabata_cardio = tabata_generator(@cardio_exercises, 'Squats sautés')
#     # @tabata_abdos = tabata_generator(@abdos_exercises, 'Gainage abdos position assise')
#     # @tabata_force1 = [pecs_exo_selector, back_exo_selector, tris_and_epaules_exo_selector].shuffle
#     # @tabata_force2 = [pecs_exo_selector, back_exo_selector, tris_and_epaules_exo_selector].shuffle

  end

#   def tabata_cardio
#     @tabata_cardio ||= TabataCardioService.new(@exercises).generate_tabata
#   end


#   def exos_generator(exercise_type)
#     exos_by_type = filter_exos(exercise_type)
#     exos_available = filter_equipment(exos_by_type)
#   end

#   def filter_exos(exercise_type)
#     exos = []
#     Exercise.find_each do |exo|
#       if exo.exercise_type == exercise_type
#         exos << exo
#       end
#     end
#     exos
#   end

#   def exercises_available
#     @exercises = Exercise.where(equipment: 'Aucun')
#     @exercises += Exercise.where(equipment: 'TRX') if params[:query][:trx]== "1"
#     @exercises += Exercise.where(equipment: 'Haltères') if params[:query][:weights]== "1"
#     @exercises -= Exercise.where(name: 'Reverse snow angels') if params[:query][:weights]== "1" || params[:query][:trx]== "1"
#     @exercises += Exercise.where(equipment: 'Barre de tractions') if params[:query][:pull_up_bar]== "1"
#     @exercises += Exercise.where(equipment: 'Rouleau') if params[:query][:abs_wheel]== "1"
#     @exercises += Exercise.where(equipment: 'Chaise/banc') if params[:query][:chair]== "1"
#     @exercises += Exercise.where(equipment: 'Corde à sauter') if params[:query][:jumping_rope]== "1"
#   end

#   def tabata_generator(exercises_array, fixed_exercise_name)
#     tabata = []
#     fixed_exercise = Exercise.where('name = ?', fixed_exercise_name)[0]
#     tabata << fixed_exercise
#     exercises_array -= [fixed_exercise]
#     2.times do
#       # shuffle(exercises_array)
#       exercise = exercises_array.shuffle.sample
#       exercises_array -= [exercise]
#       tabata << exercise
#     end
#     tabata.shuffle!
#   end

#   def pecs_exo_selector
#     exo = @pecs_exercises.shuffle.sample
#     @pecs_exercises -= [exo]
#     exo
#   end

#   def back_exo_selector
#     exo = @back_exercises.shuffle.sample
#     @back_exercises -= [exo]
#     exo
#   end

#   def tris_and_epaules_exo_selector
#     exo = @tris_and_epaules_exercises.shuffle.sample
#     @tris_and_epaules_exercises -= [exo]
#     exo
#   end

end
