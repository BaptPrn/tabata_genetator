class TabataCardioService
  def initialize(exercises)
    @exercises = exercises
    filter_cardio_exercises
  end

  def filter_cardio_exercises
    @exercises.delete_if do |exercise|
      exercise.exercise_type != 'Cardio' || exercise.name == 'Squats sautés'
    end
  end

  def generate_tabata
    tabata = [Exercise.where(name: 'Squats sautés')[]]
    2.times do
      exercise = @exercises.sample
      tabata << exercise
      @exercises -= [exercise]
    end
    tabata.shuffle!
  end
end

 # def select_exercises_available(tabata_type, params)
 #    exercises = Exercise.where(exercise_type: tabata_type)


 #    tabata_exercises = []
 #    Exercise.find_each do |exercise|
 #    if exercise.exercise_type == tabata_type
 #      tabata_exercises << exercise
 #    end
 #  end
 #  filter_exercises_by_equipment(tabata_exercises)
