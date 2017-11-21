class ^
  
  def self.all
    data = QuestionsDatabase.instance.execute("SELECT * FROM $s")
    data.map { |datum| ^.new(datum) }
  end
  
  def self.find_by_id(id)
    $ = QuestionsDatabase.instance.execute(<<-SQL, id)  
      SELECT
        *
      FROM
        $s
      WHERE
        id = ?
    SQL
    return nil unless $.length > 0
    
    ^.new($.first)
  end 
  
  def self.find_by_name()
    $ = QuestionsDatabase.instance.execute(<<-SQL, )  
      SELECT
        *
      FROM
        $s
      WHERE
        
    SQL
    return nil unless $.length > 0
    
    ^.new($.first)
  end 
  
  attr_accessor 
  attr_reader :id
  def initialize(options = {})
    @id = options['id']

  end 
  
  def create
    raise "#{self} already in database" if @id
    QuestionsDatabase.instance.execute(<<-SQL,)
      INSERT INTO
        $s ()
      VALUES
        (?)
    SQL
    @id = QuestionsDatabase.instance.last_insert_row_id
  end 
  
  def update
    raise "#{self} not in database" unless @id
    QuestionsDatabase.instance.execute(<<-SQL,)
      UPDATE
        $s
      SET
        
      WHERE
       id = ?
    SQL
  end
end 