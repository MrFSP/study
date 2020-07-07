module Exercise
  module Arrays
    class << self
      def replace(array)
        max = array.reduce { |acc, number| number > acc ? number : acc }
        array.map { |el| el > 0 ? max : el }
      end

      def search(array, query)
        iter(0, array.length - 1, array, query)
      end

      def iter(left, right, array, query)
        mid_index = (left + right) / 2
        number = array[mid_index]
        return mid_index if number == query
        return -1 if left >= right
        return iter(left, mid_index, array, query) if number > query
        iter(mid_index + 1, right, array, query)
      end
    end
  end
end
