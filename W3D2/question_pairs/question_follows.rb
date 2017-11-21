class QuestionFollow
  
  def self.all
    data = QuestionsDatabase.instance.execute("SELECT * FROM question_follows")
    data.map { |datum| QuestionFollow.new(datum) }
  end
  
  def self.find_by_id(id)
    question_follow = QuestionsDatabase.instance.execute(<<-SQL, id)  
      SELECT
        *
      FROM
        question_follows
      WHERE
        id = ?
    SQL
    return nil unless question_follow.length > 0
    
    QuestionFollow.new(question_follow.first)
  end 
  
  def self.find_by_follower_id(follower_id)
    question_follow = QuestionsDatabase.instance.execute(<<-SQL, follower_id)  
      SELECT
        *
      FROM
        question_follows
      WHERE
        follower_id = ?
    SQL
    return nil unless question_follow.length > 0
    
    QuestionFollow.new(question_follow.first)
  end 
  
  def self.followers_for_question_id(question_id)
    followers = QuestionsDatabase.instance.execute(<<-SQL, question_id)  
      SELECT
        *
      FROM
        users
      JOIN
        question_follows ON users.id = question_follows.follower_id 
      WHERE
        question_follows.question_id = ?
    SQL
    return nil unless followers.length > 0
    
    followers.map { |datum| User.new(datum) }
  end 
  
  def self.followed_questions_for_user_id(user_id)
    questions = QuestionsDatabase.instance.execute(<<-SQL, user_id)  
      SELECT
        *
      FROM
        questions
      JOIN
        question_follows ON questions.id = question_follows.question_id 
      WHERE
        question_follows.follower_id = ?
    SQL
    return nil unless questions.length > 0
    
    questions.map { |datum| Question.new(datum) }
  end
  
  def self.most_followed_questions(n)
    questions = QuestionsDatabase.instance.execute(<<-SQL, n)  
      SELECT
        *, COUNT(question_follows.question_id) AS num_followers
      FROM
        questions
      JOIN
        question_follows ON questions.id = question_follows.question_id 
      GROUP BY
        questions.id LIMIT ?
    SQL
    return nil unless questions.length > 0
    
    questions.map { |datum| Question.new(datum) }
  end
  
  attr_accessor :follower_id, :question_id
  attr_reader :id
  def initialize(options = {})
    @id = options['id']
    @follower_id = options['follower_id']
    @question_id = options['question_id']
  end 
  
  def create
    raise "#{self} already in database" if @id
    QuestionsDatabase.instance.execute(<<-SQL, @follower_id, @question_id)
      INSERT INTO
        question_follows (follower_id, question_id)
      VALUES
        (?, ?)
    SQL
    @id = QuestionsDatabase.instance.last_insert_row_id
  end 
  
  def update
    raise "#{self} not in database" unless @id
    QuestionsDatabase.instance.execute(<<-SQL, @follower_id, @question_id)
      UPDATE
        question_follows
      SET
        follower_id = ?, @question_id = ?
      WHERE
       id = ?
    SQL
  end
end 