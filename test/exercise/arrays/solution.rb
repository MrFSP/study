module Exercise
  module Arrays
    class << self
      def replace(array)
        result = []
        max = array[0]

        array.each { |number| max = number if number > max }

        l = -> (number) { number.positive? ? max : number }
        array.each { |number| result << l.call(number) }

        result
      end

      def search(_array, _query)
        low = 0
        high = _array.length - 1
        while low <= high
          index = (low + high) / 2
          number = _array[index]
          return index if number == _query
          next high = index - 1 if number > _query
          low = index + 1
        end
        -1
      end
    end
  end
end
