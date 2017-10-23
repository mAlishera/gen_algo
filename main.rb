require_relative 'gen_pop'
require_relative 'algo'

population = Population.new
population.seed!

1.upto(Algo::NUM_GENERATIONS).each do |generation|

  offspring = Population.new

  while offspring.count < population.count
    parent1 = population.select
    parent2 = population.select

    child1, child2 = parent1 & parent2

    child1.mutate
    child2.mutate
    offspring.chromosomes << [child1, child2].sample
  end

  puts "Generation #{generation} - Average: #{population.average_fitness.round(2)} - Max: #{population.max_fitness}"

  population = offspring
end
