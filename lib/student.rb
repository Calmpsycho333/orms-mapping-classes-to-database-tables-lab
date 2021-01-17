#require 'pry'
class Student
attr_accessor  :name, :grade
attr_reader :id

def initialize(name,grade, id = nil)
  @name = name
  @id = id
  @grade = grade
end




def self.create_table
  sql =  <<-SQL 
    CREATE TABLE IF NOT EXISTS students (
      id INTEGER PRIMARY KEY, 
      name TEXT, 
      grade TEXT
      )
      SQL
  DB[:conn].execute(sql) 
end

def self.drop_table
  sql =  <<-SQL 
  DROP TABLE students
  SQL
  DB[:conn].execute(sql)
end
def save
  sql = <<-SQL
    INSERT INTO students (name, grade) 
    
    VALUES (?, ?)
  SQL

  DB[:conn].execute(sql,self.name, self.grade)
sql = <<-SQL
SELECT id FROM students 
WHERE name = ? and grade = ?
SQL
sql_is_insane = DB[:conn].execute(sql,self.name, self.grade) 
@id = sql_is_insane[0][0]
#binding.pry 
#class Student
end
def self.create(name:, grade:)
  student = Student.new( name, grade)
  student.save
  student
end
  
  


end
