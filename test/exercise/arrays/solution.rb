module Exercise
  module Arrays
    class << self
      def replace(array)
        result = []
        max = array.max()
        array.each { |number|
            if number > 0
                result.push(max)
            else
                result.push(number)
            end
        }
        return result
    end

      def search(_array, _query)
        low = 0
        high = _array.length() - 1
        while low <= high
            index = (low + high) / 2
            number = _array[index]
            if number == _query
                return index
            elsif number > _query
                high = index - 1
            else
                low = index + 1
            end
        end
        return -1
      end
    end
  end
end
