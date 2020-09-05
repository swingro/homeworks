require "byebug"
class Stack
    def initialize
      # create ivar to store stack here!
        @store = []
    end

    def push(el)
      # adds an element to the stack
      @store.push(el)
    end

    def pop
      # removes one element from the stack
      @store.pop
    end

    def peek
      # returns, but doesn't remove, the top element in the stack
      @store[-1]
    end
  end


  class Queque
    def initialize
      # create ivar to store stack here!
        @store = []
    end

    def enqueque(el)
      # adds an element to the stack
      @store.push(el)
    end

    def dequeque
      # removes one element from the stack
      @store.shift
    end

    def peek
      # returns, but doesn't remove, the top element in the stack
      @store[0]
    end
  end

  class Map
      def initialize
        # create ivar to store stack here!
          @store = Array.new(){|el| Array.new}
      end
  
      def set(key, value)
        # adds an element to the stack
        @store.push([key, value])
      end
  
      def delete(key)
        # removes one element from the stack
        #debugger
        (0...@store.length).each do |i|
            if @store[i][0] == key
                @store.delete_at(i) 
                break
            end
        end
      end
  
      def get(key)
        (0...@store.length).each do |i|
            if @store[i][0] == key
                return @store[i][1] 
            
            end
        end
      end
      
      def show()
        @store
      end

    end

    

