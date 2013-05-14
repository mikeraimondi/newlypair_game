def query_question_answers
  question_answers = []
  i = 1
  begin
    puts "Please enter a question"
    question = gets.chomp
    puts "Please enter the answer"
    answer = gets.chomp
    question_answers.push([question,answer])
    if i >= 2
      puts "Would you like to enter another question? (y/n)"
      repeat = gets.chomp.downcase
    end
    i += 1
  end while (repeat != "no" && repeat != "n")
  question_answers
end


def build_question_answers
  question_source = query_question_answers()
  question_source.shuffle!
  question_source.pop(2) unless question_source.length <=2
  question_answers = []
  question_source.each do |q_a|
    question_answers.push( {question: q_a[0], answer: q_a[1]} )
  end
  question_answers
end

def newlypair_game
  question_answers = build_question_answers
  system "clear"
  system ("cls")
  puts '--- Welcome to the Newlypair Game: Trivia Edition ---'
  score = 0
  question_answers.each do |q_a|
    puts  q_a[:question]
    response = gets.chomp
    if response.downcase == q_a[:answer].downcase
      score += 1
      puts "Correct! You've earned a point"
    else
      puts "Incorrect. No point for you."
    end
  end
  if score == 0
    puts("You haven't earned any points")
  elsif score == 1
    puts("You've earned #{score} point.")
  else
    puts("You've earned #{score} points.")
  end

end

newlypair_game()
