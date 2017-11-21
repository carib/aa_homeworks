class Reply
  
  def self.all
    data = QuestionsDatabase.instance.execute("SELECT * FROM replies")
    data.map { |datum| Reply.new(datum) }
  end
  
  def self.find_by_id(id)
    reply = QuestionsDatabase.instance.execute(<<-SQL, id)  
      SELECT
        *
      FROM
        replies
      WHERE
        id = ?
    SQL
    return nil unless reply.length > 0
    
    Reply.new(reply.first)
  end 
  
  def self.find_by_question_id(question_id)
    replies = QuestionsDatabase.instance.execute(<<-SQL, question_id)  
      SELECT
        *
      FROM
        replies
      WHERE
        question_id = ?
    SQL
    return nil unless reply.length > 0
    
    replies.map { |datum| Reply.new(datum) }
  end 
  
  def self.find_by_user_id(user_id)
    reply = QuestionsDatabase.instance.execute(<<-SQL, user_id)  
      SELECT
        *
      FROM
        replies
      WHERE
        user_id = ?
    SQL
    return nil unless reply.length > 0
    
    Reply.new(reply.first)
  end 
  
  def self.find_by_parent_id(parent_id)
    reply = QuestionsDatabase.instance.execute(<<-SQL, parent_id)  
      SELECT
        *
      FROM
        replies
      WHERE
        parent_id = ?
    SQL
    return nil unless reply.length > 0
    
    Reply.new(reply.first)
  end 
  
  attr_accessor :body, :question_id, :user_id, :parent_id
  attr_reader :id
  def initialize(options = {})
    @id = options['id']
    @question_id = options['question_id']
    @user_id = options['user_id']
    @parent_id = options['parent_id']
  end 
  
  def create
    raise "#{self} already in database" if @id
    QuestionsDatabase.instance.execute(<<-SQL, @question_id, @user_id, @parent_id)
      INSERT INTO
        replies (question_id, user_id, parent_id)
      VALUES
        (?, ?, ?)
    SQL
    @id = QuestionsDatabase.instance.last_insert_row_id
  end 
  
  def update
    raise "#{self} not in database" unless @id
    QuestionsDatabase.instance.execute(<<-SQL, @question_id, @user_id, @parent_id)
      UPDATE
        replies
      SET
        question_id = ?, user_id = ?, parent_id = ?
      WHERE
       id = ?
    SQL
  end
  
  def author
    User.find_by_id(self.user_id)
  end
  
  def question
    Question.find_by_id(self.question_id)
  end
  
  def parent_reply
    Reply.find_by_id(self.parent_id)
  end
  
  def child_replies
    Reply.find_by_parent_id(self.id)
  end
end 