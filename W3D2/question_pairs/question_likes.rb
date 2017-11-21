class QuestionLike
  
  def self.all
    data = QuestionsDatabase.instance.execute("SELECT * FROM question_likes")
    data.map { |datum| QuestionLike.new(datum) }
  end
  
  def self.find_by_id(id)
    question_like = QuestionsDatabase.instance.execute(<<-SQL, id)  
      SELECT
        *
      FROM
        question_likes
      WHERE
        id = ?
    SQL
    return nil unless question_like.length > 0
    
    QuestionLike.new(question_like.first)
  end 
  
  def self.find_by_user_id(user_id)
    question_like = QuestionsDatabase.instance.execute(<<-SQL, user_id)  
      SELECT
        *
      FROM
        question_likes
      WHERE
        user_id = ?
    SQL
    return nil unless question_like.length > 0
    
    QuestionLike.new(question_like.first)
  end 
  
  def self.find_by_question_id(question_id)
    question_like = QuestionsDatabase.instance.execute(<<-SQL, question_id)  
      SELECT
        *
      FROM
        question_likes
      WHERE
        question_id = ?
    SQL
    return nil unless question_like.length > 0
    
    QuestionLike.new(question_like.first)
  end
  
  def self.likers_for_question_id(question_id)
    likers = QuestionsDatabase.instance.execute(<<-SQL, question_id)  
      SELECT
        *
      FROM
        users
        JOIN question_likes ON users.id = question_likes.user_id
      WHERE
        question_id = ?
    SQL
    return nil unless likers.length > 0
    
    likers.map { |datum| User.new(datum) }
  end
  
  def self.num_likes_for_question_id(question_id)
    num_likes = QuestionsDatabase.instance.execute(<<-SQL, question_id)  
      SELECT
        COUNT(question_likes.user_id) AS likes
      FROM
        users
        JOIN question_likes ON users.id = question_likes.user_id
      WHERE
        question_id = ?
    SQL
    
    num_likes.first['likes']
  end
  
  def self.liked_questions_for_user_id(user_id)
    liked_qs = QuestionsDatabase.instance.execute(<<-SQL, user_id)  
      SELECT
        *
      FROM
        questions
        JOIN question_likes ON questions.id = question_likes.question_id
      WHERE
        question_likes.user_id = ?
    SQL
    return nil unless liked_qs.length > 0
    
    liked_qs.map { |datum| Question.new(datum) }
  end
  
  def self.most_liked_questions(n)
    most_liked = QuestionsDatabase.instance.execute(<<-SQL, n)  
      SELECT
        *, COUNT(question_likes.user_id)
      FROM
        questions
        JOIN question_likes ON questions.id = question_likes.question_id
      GROUP BY 
        questions.title
      LIMIT
        ?
    SQL
    
    most_liked.map { |datum| Question.new(datum) }
  end 
  
  attr_accessor :user_id, :question_id
  attr_reader :id
  def initialize(options = {})
    @id = options['id']
    @user_id = options['user_id']
    @question_id = options['question_id']
  end 
  
  def create
    raise "#{self} already in database" if @id
    QuestionsDatabase.instance.execute(<<-SQL, @user_id, @question_id)
      INSERT INTO
        question_likes (user_id, question_id)
      VALUES
        (?, ?)
    SQL
    @id = QuestionsDatabase.instance.last_insert_row_id
  end 
  
  def update
    raise "#{self} not in database" unless @id
    QuestionsDatabase.instance.execute(<<-SQL, @user_id, @question_id)
      UPDATE
        question_likes
      SET
        user_id = ?, question_id = ?
      WHERE
       id = ?
    SQL
  end
end 