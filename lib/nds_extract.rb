$LOAD_PATH.unshift(File.dirname(__FILE__))
require_relative './directors_database'
require 'pry'

def directors_totals(source)
  result = {}
  director_index = 0
  while director_index < source.size do
    director = source[director_index]
    result[director[:name]] = gross_for_director(director)
    director_index += 1
  end
  return result
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
  
  list_of_directors = []
  name_idx = 0
  while name_idx < source.length
    list_of_directors << source[name_idx][:name]
    name_idx += 1
  end
 return list_of_directors
end

=begin
# ESTO NO
arr = [1,2,3]
idx = 0
while idx < arr[idx].length
  puts arr[idx]
end

# ESTO SI
arr = [1,2,3]
idx = 0
while idx < arr.length
  puts arr[idx]
end
=end

def total_gross(source)
  # Write this implementation
  #
  # Should use methods:
  # 1. directors_totals: returns a Hash of { dir_name => gross }
  # 2. list_of_directors: names provides an Array of directors names (use
  
  total_all_directors = 0
  idx_dir = 0
  # Array de string
  noms_de_dirs = list_of_directors(source)
  # Hash donde las llaves son string y los valores son Integer
  money_dirs = directors_totals(source)
  
  while idx_dir < noms_de_dirs.length
    # Key is a string
    key = noms_de_dirs[idx_dir]
    total_all_directors += money_dirs[key]
    idx_dir += 1 
  end
  
  return total_all_directors
  
  #
  # Visit each key (i.e. director name), look up the value in the hash
  # returned by directors_totals, and add it to a running total. When done,
  # return the total
end


