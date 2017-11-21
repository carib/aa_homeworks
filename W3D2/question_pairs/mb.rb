require 'byebug'
require_relative 'requirements'
class ModelBase
  
  def self.all
    data = QuestionsDatabase.instance.execute("SELECT * FROM #{self.name.tableize}")
    data.map { |datum| self.new(datum) }
  end
  
  def self.find_by_id(id)
    table = QuestionsDatabase.instance.execute(<<-SQL)  
      SELECT
        *
      FROM
        #{self.name.tableize}
      WHERE
        id = #{id}
    SQL
    return nil unless table.length > 0
    
    self.new(table.first)
  end
  
  def self.where(options)
    debugger
    QuestionsDatabase.instance.execute(<<-SQL)
      SELECT
        *
      FROM
        #{self.name.tableize}
      WHERE
        #{options.map { |key, val| "#{key} = #{val.is_a?(String) ? "'#{val}'" : val}"}.join(" OR ")}

    SQL
  end
  
  def initialize(options = {})
  end
  
  def save
    raise "#{self} already in database" if @id
    
    QuestionsDatabase.instance.execute(<<-SQL, *i_vars[1..-1])
      INSERT INTO
        #{self.class.name.tableize} (#{t_names})
      VALUES
        (?, ?)
    SQL
    @id = QuestionsDatabase.instance.last_insert_row_id
  end 
  
  def update
    raise "#{self} not in database" unless @id

    QuestionsDatabase.instance.execute(<<-SQL, *i_vars.rotate)
      UPDATE
        #{self.class.name.tableize}
      SET
        #{t_names.split(", ").map { |t| "#{t} = ?"}.join(", ")}
      WHERE
       id = ?
    SQL
  end
  
  private
  
  def i_vars
    self.instance_variables.map { |ivar| self.instance_variable_get(ivar)}
  end
  
  def t_names
    self.instance_variables.map { |var| var.to_s[1..-1] }[1..-1].join(", ")
  end
end 