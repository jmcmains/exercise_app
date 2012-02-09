# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'csv'

puts "Importing anchor point heights..."
CSV.foreach(Rails.root.join('csv/anchor_point_heights.csv'), headers: true) do |row|
  AnchorPointHeight.create! do |height|
    height.name = row[0]
  end
end

puts "Importing categories..."
CSV.foreach(Rails.root.join('csv/categories.csv'), headers: true) do |row|
  Category.create! do |category|
    category.name = row[0]
  end
end

puts "Importing exercises..."
CSV.foreach(Rails.root.join('csv/exercises.csv'), headers: true, col_sep: ';') do |row|
  Exercise.create! do |exercise|
    exercise.name = row[0]
    exercise.description = row[1].force_encoding 'utf-8'
  end
end

puts "Importing exercise accessories..."
CSV.foreach(Rails.root.join('csv/exercise_accessories.csv'), headers: true) do |row|
  ExerciseAccessory.create! do |ea|
    ea.exercise_id = row[0]
    ea.accessory_id = row[1]
  end
end

puts "Importing exercise categories..."
CSV.foreach(Rails.root.join('csv/exercise_categories.csv'), headers: true) do |row|
  ExerciseCategory.create! do |ec|
    ec.exercise_id = row[0]
    ec.category_id = row[1]
  end
end

puts "Importing exercise forces..."
CSV.foreach(Rails.root.join('csv/exercise_forces.csv'), headers: true) do |row|
  ExerciseForce.create! do |ef|
    ef.exercise_id = row[0]
    ef.force_id = row[1]
  end
end

puts "Importing exercise heights..."
CSV.foreach(Rails.root.join('csv/exercise_heights.csv'), headers: true) do |row|
  ExerciseHeight.create! do |eh|
    eh.exercise_id = row[0]
    eh.height_id = row[1]
  end
end

puts "Importing exercise muscles..."
CSV.foreach(Rails.root.join('csv/exercise_muscles.csv'), headers: true) do |row|
  ExerciseMuscle.create! do |em|
    em.exercise_id = row[0]
    em.muscle_id = row[1]
    em.primary = row[2]
  end
end

puts "Importing exercise positions..."
CSV.foreach(Rails.root.join('csv/exercise_positions.csv'), headers: true) do |row|
  ExercisePosition.create! do |ep|
    ep.exercise_id = row[0]
    ep.position_id = row[1]
  end
end

puts "Importing exercise posts..."
CSV.foreach(Rails.root.join('csv/exercise_posts.csv'), headers: true) do |row|
  ExercisePost.create! do |ep|
    ep.exercise_id = row[0]
    ep.post_id = row[1]
  end
end

puts "Importing exercise workouts..."
CSV.foreach(Rails.root.join('csv/exercise_workouts.csv'), headers: true) do |row|
  ExerciseWorkout.create! do |ew|
    ew.exercise_id = row[0]
    ew.workout_id = row[1]
  end
end

puts "Importing forces..."
CSV.foreach(Rails.root.join('csv/forces.csv'), headers: true) do |row|
  Force.create! do |force|
    force.name = row[0]
  end
end

puts "Importing glossaries..."
CSV.foreach(Rails.root.join('csv/glossaries.csv'), headers: true, col_sep: '|') do |row|
  Glossary.create! do |glossary|
    glossary.term = row[0]
    glossary.description = row[1].force_encoding 'utf-8'
  end
end

puts "Importing glossary pictures..."
CSV.foreach(Rails.root.join('csv/glossary_pictures.csv'), headers: true) do |row|
  GlossaryPicture.create! do |gp|
    gp.glossary_id = row[0]
    gp.picture = row[1]
  end
end

puts "Importing positions..."
CSV.foreach(Rails.root.join('csv/positions.csv'), headers: true) do |row|
  Position.create! do |position|
    position.name = row[0]
  end
end

puts "Importing posts..."
CSV.foreach(Rails.root.join('csv/posts.csv'), headers: true) do |row|
  Post.create! do |post|
    post.name = row[0]
  end
end

puts "Importing optional accessories..."
CSV.foreach(Rails.root.join('csv/optional_accessories.csv'), headers: true) do |row|
  OptionalAccessory.create! do |accessory|
    accessory.name = row[0]
  end
end

puts "Importing target muscles..."
CSV.foreach(Rails.root.join('csv/target_muscles.csv'), headers: true) do |row|
  TargetMuscle.create! do |muscle|
    muscle.name = row[0]
  end
end

puts "Importing tips..."
CSV.foreach(Rails.root.join('csv/tips.csv'), headers: true, col_sep: ';') do |row|
  Tip.create! do |tip|
    tip.exercise_id = row[0]
    tip.content = row[2].force_encoding 'utf-8'
  end
end

puts "Importing variations..."
CSV.foreach(Rails.root.join('csv/variations.csv'), headers: true, col_sep: ';') do |row|
  Variation.create! do |variation|
    variation.exercise_id = row[0]
    variation.content = row[2].force_encoding 'utf-8'
  end
end

puts "Importing videos..."
CSV.foreach(Rails.root.join('csv/videos.csv'), headers: true) do |row|
  Video.create! do |video|
    video.exercise_id = row[0]
    video.location = row[1]
  end
end

puts "Importing workouts..."
CSV.foreach(Rails.root.join('csv/workouts.csv'), headers: true) do |row|
  Workout.create! do |workout|
    workout.name = row[0]
    workout.sets = row[1]
    workout.reps = row[2]
    workout.per_week = row[3]
    workout.duration = row[4]
    workout.tempo = row[5]
  end
end

