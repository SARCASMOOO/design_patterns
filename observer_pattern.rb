require 'observer'

module Subject
    def initialize
      @observers=[]
    end

    def add_observer(observer)
      @observers << observer
    end

    def delete_observer(observer)
      @observers.delete(observer)
    end

    def notify_observers
      @observers.each do |observer|
        observer.update(self)
      end
    end
end

  class Payroll
     def update( changed_employee )
       puts("Cut a new check for #{changed_employee.name}!")
       puts("His salary is now #{changed_employee.salary}!")
     end
   end

   class TaxMan
     def update( changed_employee )
       puts("Send #{changed_employee.name} a new tax bill!")
     end
   end

   class Employee
     include Observable
     attr_reader :name, :address
     attr_reader :salary

     def initialize( name, title, salary)
      super()
      @name = name
      @title = title
      @salary = salary
     end

     def salary=(new_salary)
       old_salary = @salary
       @salary = new_salary
       if old_salary != new_salary
         changed
         notify_observers(self)
       end
     end

     def title=(new_title)
      old_title = @title
      @title = new_title
      if old_title != new_title
        changed = true
        notify_observers(self)
      end
    end
   end

   fred = Employee.new("Fred", "Crane Operator", 30000)

   fred.salary = 1000000
   # Warning! Inconsistent state here!
   fred.title = 'Vice President of Sales'
   puts ("Freds salary: #{fred.salary}")
