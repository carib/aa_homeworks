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
    # ...
  end

  def self.table_name
    "#{self.name.downcase}s"
  end

  def self.all
    DBConnection.execute(<<-SQL)
      SELECT
        *
      FROM
        #{table_name}
    SQL
  end

  def self.parse_all(results)
    results.map { |params| self.new(params) }
  end

  def self.find(id)
    # self.all.find { |obj| obj.id == id }
  end

  def initialize(params = {})
    params.each do |attr_name, val|
      raise "unknown attribute '#{attr_name}'" unless self.class.columns.include?(attr_name)
      self.send("#{attr_name}=", val)
    end
  end

  def attributes
    @attributes ||= {}
  end

  def attribute_values
    # ...
  end

  def insert
    # ...
  end

  def update
    # ...
  end

  def save
    # ...
  end
end
