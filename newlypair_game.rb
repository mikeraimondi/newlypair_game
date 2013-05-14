QUESTION_ANSWERS_DEFAULT = [
  ['What is your name?','Arthur'],
  ['What is your quest?', 'The Holy Grail'],
  ['What is the airspeed velocity of an unladen swallow?', 'African or European?']
  ]

FILE_PATH = 'question_answer.txt'

def load_question_answers(file)
  lines = []
  File.readlines(file).each do |line|
    unless line.slice(0,2) == '//'
      lines.push(line.strip) if line.strip != ""
    end
  end
  q_a_array=[]
  is_question = true
  question = ""
  lines.each do |line|
    if is_question
      is_question = false
      question = line
    else
      is_question = true
      q_a_array.push([question,line])
    end
  end
  q_a_array
end

def build_question_answers
  question_source = QUESTION_ANSWERS_DEFAULT
  question_answers = []
  if File.exists?(FILE_PATH)
    begin
      question_source = load_question_answers(FILE_PATH)
    rescue
    end 
  end
  question_source.shuffle!
  question_source.each do |q_a|
    question_answers.push( {question: q_a[0], answer: q_a[1]} )
  end
  question_answers
end

def newlypair_game
  question_answers = build_question_answers
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
