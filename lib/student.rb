require_relative "../config/environment.rb"

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
 end

 def self.create
 end

 def self.new_from_db
 end

 def self.find_by_name
 end

end
