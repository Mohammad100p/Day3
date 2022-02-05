# Question 1
class Random_generator
  def random_numbers
    Array.new(10) {rand 10}
 end
end

class Frequency
  def setfrequency(temp)
    hash = Hash.new(0)
    temp.each { |key| hash[key] += 1}
    hash
 end
end

class Main
  random= Random_generator.new

  frequency= Frequency.new
  puts frequency.setfrequency(random.random_numbers());
end

# Question 2
# It will plus the values
class Runningsum
  def sum_numbers(arr)
    num = 0
    arr.each do |val|
      puts num = num+ val
    end
  end
end

# Array send kr ri h
class SendArray
  def total
    sum = Runningsum.new
    puts 'Elements here:'
    arr = gets
    puts "You can enter total these numbers #{arr}"
    #arr = arr.chomp
    arr = arr.to_i
    array = Array.new
    while arr > 0
      array.push(gets.to_i)
      arr = arr-1;
    end
    puts 'Running sum of the array is:'
    sum.sum_numbers(array)
  end
end

# Main class
class Main
  check = SendArray.new
  check.total
end


# Question 3
require 'csv'
# class password generator
class Passwordgenerator
  attr_accessor :pswd

  def initialize(*top)
    @numbers = top[0].to_i
    @alphabets = top[1].to_i
    @special_char = top[2].to_i

    characters = @numbers + @alphabets + @special_char

    generate_char(characters)
  end

  # Generating random password
  def generate_char(characters)
    numbers_ka_count = 0
    alphabets_ka_count = 0
    special_char_ka_count = 0
    @pswd = ''

    val = @numbers + @alphabets + @special_char
    num = 0
    if characters > 0
      while num < val
        char = rand(0..2)
        num += 1
        case char
        when 0
          break if numbers_ka_count == @numbers

          @pswd << rand(0..9).to_s
          numbers_ka_count += 1

        when 1
          break if alphabets_ka_count == @alphabets

          @pswd << ('A'..'z').to_a[rand(26)]
          alphabets_ka_count += 1

        when 2
          break if special_char_ka_count == @special_char

          @pswd << ('!'..'?').to_a[rand(27)]
          special_char_ka_count += 1
        end

        break if @pswd.size == characters
      end
    end

    return @pswd
  end
end

# Main class for the required Input
def output
  puts 'Enter how many numbers do you want in your password?'
  numbers = gets

  puts 'Enter how many alphabets do you want in your password?'
  alphabets = gets

  puts 'Enter how many characters do you want in your password?'
  special_char = gets

  store_pswd = Passwordgenerator.new(numbers, alphabets, special_char)
  store_pswd.pswd
end

# Append the output
CSV.open('output.csv', 'a+') do |i|
  File.write('output.csv', output)
end

# Read the file
file = CSV.read('output.csv', headers: false)
puts file
