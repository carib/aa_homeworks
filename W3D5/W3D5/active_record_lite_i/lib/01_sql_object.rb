require_relative 'db_connection'
require 'active_support/inflector'
# NB: the attr_accessor we wrote in phase 0 is NOT used in the rest
# of this project. It was only a warm up.

class SQLObject
  def self.columns
    @columns ||= DBConnection.execute2(<<-SQL)
      SELECT
        *
      FROM
        #{table_name}
    SQL

    @columns.first.map(&:to_sym)
  end

  def self.finalize!
    columns.each do |col|
      define_method(col) { self.attributes[col] }
      define_method("#{col}=") { |obj| self.attributes[col] = obj }
    end
  end

  def self.table_name=(table_name = self.table_name)
    @table_name = table_name
  end

  def self.table_name
    "#{self.name.downcase}s"
  end

  def self.all
    objects = DBConnection.execute(<<-SQL)
      SELECT
        *
      FROM
        #{table_name}
    SQL
    self.parse_all(objects)
  end

  def self.parse_all(results)
    results.map { |params| self.new(params) }
  end

  def self.find(id)
    object = DBConnection.execute(<<-SQL)
      SELECT
        *
      FROM
        #{table_name}
      WHERE
        #{table_name}.id = #{id}
      LIMIT
        1
    SQL
    self.parse_all(object).first
  end

  def initialize(params = {})
    params.each do |attr_name, val|
      attr_name = attr_name.to_sym
      raise "unknown attribute '#{attr_name}'" unless self.class.columns.include?(attr_name)
      self.send("#{attr_name}=", val)
    end
  end

  def attributes
    @attributes ||= {}
  end

  def attribute_values
    self.class.columns.map { |col| self.send(col) }
  end

  def insert
    col_names = self.class.columns.join(', ')
    question_marks = ['?'] * attribute_values.size


    DBConnection.execute(<<-SQL, *attribute_values)
      INSERT INTO
        #{self.class.table_name} (#{col_names})
      VALUES
        (#{question_marks.join(', ')})
    SQL
    DBConnection.last_insert_row_id
  end

  def update
    set_line = self.class.columns.map { |col| "#{col} = ?" }.join(', ')
    # p attribute_values
    DBConnection.execute(<<-SQL *attribute_values)
      UPDATE
        #{self.class.table_name}
      SET
        #{set_line}
      WHERE
        id = #{self.id}
    SQL
  end

  def save
    # ...
  end
end
