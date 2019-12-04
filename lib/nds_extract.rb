$LOAD_PATH.unshift(File.dirname(__FILE__))
require_relative './directors_database'
require 'pp'

def directors_totals(source)
  result = {}
  director_index = 0
  while director_index < source.size do
    director = source[director_index]
    result[director[:name]] = gross_for_director(director)
    director_index += 1
  end
  result
end

def gross_for_director(d)
  total = 0
  index = 0

  while index < d[:movies].length do
    total += d[:movies][index][:worldwide_gross]
    index += 1
  end

  total
end

def list_of_directors(source)
  # Write this implementation
  director_index = 0
  director_names = []
  while director_index < source.length do
    director_names << source[director_index][:name]
    director_index += 1
  end
  director_names
end

def total_gross(source)

  
  total_gross = 0
  dtotals = directors_totals(source)
  director_names = list_of_directors(source)
  counter = 0
  while counter < director_names.length do
    dname = director_names[counter]
    total_gross += dtotals[dname]
    counter += 1
  end
  total_gross
end


