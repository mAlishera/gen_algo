require 'pry'
require_relative 'gen_crom'
require_relative 'algo'

class Population
  attr_accessor :chromosomes

  def initialize
    self.chromosomes = []
  end

  def seed!
    chromosomes = []
    Algo::POPULATION_SIZE.times do
      chromosomes << Chromosome.new
    end

    self.chromosomes = chromosomes
  end

  def count
    chromosomes.count
  end

  def fitness_values
    chromosomes.collect(&:fitness)
  end

  def total_fitness
    fitness_values.inject{ |total, value| total + value }
  end

  def max_fitness
    fitness_values.max
  end

  def average_fitness
    total_fitness.to_f / chromosomes.length.to_f
  end

  def select
    chromosomes.each_with_index  { |c, index| return c if c.fitness > average_fitness || index == chromosomes.count - 1 }
  end
end
