require 'pry'
require_relative 'algo'

class Chromosome
  attr_accessor :genes

  def initialize(genes = nil)
    genes ? self.genes = genes : self.genes = (1..Algo::NUM_BITS).map { rand(2) }.join
  end

  def fitness
    genes.count('1')
  end

  def mutate
    mutated = ''
    0.upto(genes.length - 1).each do |i|
      rand <= Algo::MUTATION_RATE ? mutated += do_mutate(genes[i]) : mutated += genes[i]
    end

    self.genes = mutated
  end

  def do_mutate(char)
    char == '0' ? '1' : '0'
  end

  def &(other)
    locus = rand(genes.length) + 1

    child1 = genes[0, locus] + other.genes[locus, other.genes.length]
    child2 = other.genes[0, locus] + genes[locus, other.genes.length]

    [Chromosome.new(child1), Chromosome.new(child2)]
  end
end
