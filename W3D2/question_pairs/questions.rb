require_relative 'qdb'
class Question
  
  def self.all
    data = QuestionsDatabase.instance.execute("SELECT * FROM questions")
    data.map { |datum| Question.new(datum) }
  end
  
  def self.find_by_id(id)
    question = QuestionsDatabase.instance.execute(<<-SQL, id)  
      SELECT
        *
      FROM
        questions
      WHERE
        id = ?
    SQL
    return nil unless question.length > 0
    
    question.map { |quest| Question.new(quest) }
  end 
  
  def self.find_by_title(title)
    question = QuestionsDatabase.instance.execute(<<-SQL, title)  
      SELECT
        *
      FROM
        questions
      WHERE
        title = ?
    SQL
    return nil unless question.length > 0
    
    question.map { |quest| Question.new(quest) }
  end
  
  def self.find_by_author_id(author_id)
    question = QuestionsDatabase.instance.execute(<<-SQL, author_id)  
      SELECT
        *
      FROM
        questions
      WHERE
        author_id = ?
    SQL
    return nil unless question.length > 0
    
    question.map { |quest| Question.new(quest) }
  end
  
  def self.most_followed(n)
    QuestionFollow.most_followed_questions(n)
  end
  
  attr_accessor :title, :body, :author_id
  attr_reader :id
  def initialize(options = {})
    @id = options['id']
    @title = options['title']
    @body = options['body']
    @author_id = options['author_id']
  end 
  
  def create
    raise "#{self} already in database" if @id
    QuestionsDatabase.instance.execute(<<-SQL, @title, @body, @author_id)
      INSERT INTO
        questions (title, body, author_id)
      VALUES
        (?, ?, ?)
    SQL
    @id = QuestionsDatabase.instance.last_insert_row_id
  end 
  
  def update
    raise "#{self} not in database" unless @id
    QuestionsDatabase.instance.execute(<<-SQL, @title, @body, @author_id)
      UPDATE
        questions
      SET
        title = ?, body = ?, author_id = ?
      WHERE
       id = ?
    SQL
  end
  
  def author
    User.find_by_id(self.author_id)
  end
  
  def replies
    Reply.find_by_question_id(self.id)
  end
  
  def followers
    QuestionFollow.followers_for_question_id(self.id)
  end
end 