require_relative 'mb'

class User < ModelBase

  def self.find_by_name(fname, lname)
    user = QuestionsDatabase.instance.execute(<<-SQL, fname, lname)  
      SELECT
        *
      FROM
        users
      WHERE
        fname = ?, lname = ?
    SQL
    return nil unless user.length > 0
    
    user.map { |datum| User.new(datum) }
  end 
  
  attr_accessor :fname, :lname
  attr_reader :id
  def initialize(options = {})
    @id = options['id']
    @fname = options['fname']
    @lname = options['lname']
  end 
  
  def authored_questions
    Question.find_by_author_id(self.id)
  end
  
  def authored_replies
    Reply.find_by_user_id(self.id)
  end
  
  def followed_questions
    QuestionFollow.followed_questions_for_user_id(self.id)
  end
  
  def liked_questions
    QuestionLike.liked_questions_for_user_id(self.id)
  end 
  
  def average_karma
    karma = QuestionsDatabase.instance.execute(<<-SQL, @id)  
      SELECT
        (COUNT(DISTINCT(questions.id)) / CAST(COUNT(question_likes.id) AS FLOAT)) AS avg_num_likes
      FROM
        questions
      LEFT OUTER JOIN
        question_likes ON questions.id = question_likes.question_id
      WHERE
        questions.author_id = ? AND question_likes.id IS NOT NULL
    SQL
    
    karma.first['avg_num_likes']
  end 
end 