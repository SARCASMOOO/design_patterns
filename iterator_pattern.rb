#External iteratorts
class ArrayIterator
     def initialize(array)
       #@array = array
       #Shallow copy so we don't have the array change when running
       @array = Array.new(array)
       @index = 0
     end

     def has_next?
       @index < @array.length
     end

     def item
       @array[@index]
     end

     def next_item
       value = @array[@index]
       @index += 1
       value
     end
   end


   # array = ['red', 'green', 'blue']
   #
   # i = ArrayIterator.new(array)
   # while i.has_next?
   #   puts("item: #{i.next_item}")
   # end

#Internal iterators
def for_each_element(array)
  i = 0
  while i < array.length
    yield(array[i])
    i += 1
  end
end

a = [10, 20, 30]
# for_each_element(a) {|element| puts("The element is #{element}")}

#Array implemented iterator
a.each {|element| puts("The element is #{element}")}
