module Exercise
  module Arrays
    class << self
      def replace(array)
        array.map { |el| el > 0 ? 100 : el }
      end

      def search(_array, _query)
        def iter(min_index, max_index, array, query)
          mid_index = (min_index + max_index) / 2
          number = array[mid_index]
          return mid_index if number == query
          return -1 if min_index >= max_index
          return iter(min_index, mid_index, array, query) if number > query
          iter(mid_index + 1, max_index, array, query)
        end

        iter(0, _array.length - 1, _array, _query)
      end
    end
  end
end
