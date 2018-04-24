require_relative "../config/environment.rb"

class Student

attr_accessor :id, :name, :grade

  def initialize(id,name)
    @id = nil
    @name = name
    @grade = grade
  end

  def self.create_table
    sql = <<-SQL
    CREATE TABLE students (
      id INTEGER PRIMARY KEY,
      name TEXT,
      grade INTEGER
    )
    SQL
    DB[:conn].execute(sql)
  end


  def self.drop_table
    DROP TABLE students
  end

 # -- Remember, you can access your database connection anywhere in this class  with DB[:conn]


end
