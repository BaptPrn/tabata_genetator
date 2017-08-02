class TabataService
  def initialize(params)
    @exercises = exercises_available(params)
  end

  def aggregated_exos
    @agregated_exos ||= @exercises
      .group_by {|exercise| exercise.exercise_type}
  end

  def exercises_available(params)
    exercises = Exercise.where(equipment: 'Aucun')
    exercises += Exercise.where(equipment: 'TRX') if params[:trx]== "1"
    exercises += Exercise.where(equipment: 'Haltères') if params[:weights]== "1"
    exercises -= Exercise.where(name: 'Reverse snow angels') if params[:weights]== "1" || params[:trx]== "1"
    exercises += Exercise.where(equipment: 'Barre de tractions') if params[:pull_up_bar]== "1"
    exercises += Exercise.where(equipment: 'Rouleau') if params[:abs_wheel]== "1"
    exercises += Exercise.where(equipment: 'Chaise/banc') if params[:chair]== "1"
    exercises += Exercise.where(equipment: 'Corde à sauter') if params[:jumping_rope]== "1"
    exercises
  end

end

#   def filter_cardio_exercises
#     @exercises.delete_if do |exercise|
#       exercise.exercise_type != 'Cardio' || exercise.name == 'Squats sautés'
#     end
#   end

#   def generate_tabata
#     tabata = [Exercise.where(name: 'Squats sautés')[0]]
#     2.times do
#       exercise = @exercises.sample
#       tabata << exercise
#       @exercises -= [exercise]
#     end
#     tabata.shuffle!
#   end
# end


 # def select_exercises_available(tabata_type, params)
 #    exercises = Exercise.where(exercise_type: tabata_type)


 #    tabata_exercises = []
 #    Exercise.find_each do |exercise|
 #    if exercise.exercise_type == tabata_type
 #      tabata_exercises << exercise
 #    end
 #  end
 #  filter_exercises_by_equipment(tabata_exercises)
