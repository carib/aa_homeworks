require_relative 'mb'

class Question < ModelBase
  
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
  
  def self.most_liked(n)
    QuestionLike.most_liked_questions(n)
  end 
  
  attr_accessor :title, :body, :author_id
  attr_reader :id
  def initialize(options = {})
    @id = options['id']
    @title = options['title']
    @body = options['body']
    @author_id = options['author_id']
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
  
  def likers
    QuestionLike.likers_for_question_id(self.id)
  end 
  
  def num_likes
    QuestionLike.num_likes_for_question_id(self.id)
  end 
end 