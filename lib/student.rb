require_relative "../config/environment.rb"
require 'pry'

class Student

attr_accessor :id, :name, :grade

  def initialize(id=nil,name,grade)
    @id = id
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
    sql = <<-SQL
    DROP TABLE students
    SQL
    DB[:conn].execute(sql)
  end

 # -- Remember, you can access your database connection anywhere in this class  with DB[:conn]

 def save
   sql = <<-SQL
   INSERT INTO students(name,grade)
   VALUES(?,?)
   SQL
   DB[:conn].execute(sql,self.name,self.grade)
   @id = DB[:conn].execute("SELECT last_insert_rowid() FROM students")[0][0]
 end

 def self.create(name,grade)
   student = Student.new(name,grade)
   student.save
   student
 end

 def self.new_from_db(array)
   new_student = Student.new
   new_student.id = array[0]
   new_student.name = array[1]
   new_student.grade = array[2]
   new_student
 end

 def self.find_by_name
 end

 def update
 end

end
