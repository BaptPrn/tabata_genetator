class ExercisesAggregator
  def initialize(params)
    @params = params[:query]
  end

  def grouped_exercises
    @grouped_exercises ||= exercises_available.group_by(&:exercise_type)
  end

  def generate_tabata
    if @params[:doubled_tabata] == 'Cardio'
      double_cardio
    elsif @params[:doubled_tabata] == 'Abdos'
      double_abdos
    else
      double_strength
    end
  end

  def exercises_available
    exercises = Exercise.where(equipment: 'Aucun')
    exercises += Exercise.where(equipment: 'TRX') if @params[:trx]== "1"
    exercises += Exercise.where(equipment: 'Haltères') if @params[:weights]== "1"
    exercises -= Exercise.where(name: 'Reverse snow angels') if @params[:weights]== "1" || @params[:trx]== "1"
    exercises += Exercise.where(equipment: 'Barre de tractions') if @params[:pull_up_bar]== "1"
    exercises += Exercise.where(equipment: 'Rouleau') if @params[:abs_wheel]== "1"
    exercises += Exercise.where(equipment: 'Chaise/banc') if @params[:chair]== "1"
    exercises += Exercise.where(equipment: 'Corde à sauter') if @params[:jumping_rope]== "1"
    exercises += Exercise.where(equipment: "De l'espace pour courir") if @params[:running_space]== "1"
    exercises += Exercise.where(equipment: 'Rowing machine') if @params[:rowing_machine]== "1"
    exercises += Exercise.where(equipment: 'Bike') if @params[:bike]== "1"
    exercises
  end

  def cardio_exercises
    @cardio_exercises ||= grouped_exercises['Cardio']
  end

  def abdos_exercises
    @abdos_exercises ||= grouped_exercises['Abdos']
  end

  def pecs_exercises
    @pecs_exercises ||= grouped_exercises['Pecs']
  end

  def back_exercises
    @back_exercises ||= grouped_exercises['Dos']
  end

  def shoulder_and_triceps_exercises
    @shoulder_and_triceps_exercises ||= grouped_exercises['Epaules'] + grouped_exercises['Tris']
  end

  def tabata_cardio
    tabata = cardio_exercises.shuffle.sample(3)
    @cardio_exercises -= tabata
    tabata
  end

  def tabata_abdos
    tabata = abdos_exercises.shuffle.sample(3)
    @abdos_exercises -= tabata
    tabata
  end

  def tabata_strength
    [pecs_exercise, back_exercise, shoulder_and_triceps_exercise].shuffle
  end

  def pecs_exercise
    exercise = pecs_exercises.shuffle.sample
    @pecs_exercises -= [exercise]
    exercise
  end

  def back_exercise
    exercise = back_exercises.shuffle.sample
    @back_exercises -= [exercise]
    exercise
  end

  def shoulder_and_triceps_exercise
    exercise = shoulder_and_triceps_exercises.shuffle.sample
    @shoulder_and_triceps_exercises -= [exercise]
    exercise
  end

  def double_abdos
    [tabata_cardio, tabata_abdos, tabata_strength, tabata_abdos]
  end

  def double_cardio
    [tabata_cardio, tabata_strength, tabata_abdos, tabata_cardio]
  end

  def double_strength
    [tabata_cardio, tabata_strength, tabata_abdos, tabata_strength]
  end
end
