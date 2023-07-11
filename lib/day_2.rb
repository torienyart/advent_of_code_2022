## Pseudocode
# ELF
# - A = Rock
# - B = Paper
# - C = Scissors

# YOU
# - X = Rock
# - Y = Paper
# - Z = Scissors

# SCORING
# - sum of outcome score and play score
# outcomes 
# - 0 = lose
# - 3 = draw
# - 6 = win

# play score
# - 1 = rock
# - 2 = paper
# - 3 = scissors

# input format
# A Y
# B X
# C Z

# output format
# looking for the total score if you follow the guide exactly


#STEPS
# 1. read in the file information and put into an array for each line (each round)
# 2. split each element of the array into an array of 2 elements
# 3. create a counter for your points
# 3. iterate through the array of arrays and compare the first element to the second element
#   a. assess the outcome score and the play score to get a total score for each round and add them to the counter
# 4. return the counter to get the total score

file = File.open("./info/day_2.txt")
rounds_array = file.readlines(chomp: true)

def play_numbers(round)
  round.map do |throw|
    if throw == "A" || throw == "X"
      1 #rock
    elsif throw == "B" || throw == "Y"
      2 #paper
    elsif throw == "C" || throw == "Z"
      3 #scissors
    end
  end
end

def outcome_score(elf, me)
  if me == 1 && elf == 3
    6
  elsif elf == 1 && me == 3
    0
  elsif me > elf
    6
  elsif me < elf
    0
  elsif me == elf
    3
  end
end

counter = 0

rounds_array.each do |round|
  split_round = round.split(" ")
  round_in_numbers = play_numbers(split_round)
  counter += outcome_score(*round_in_numbers)
  counter += round_in_numbers[1]
end

p counter

