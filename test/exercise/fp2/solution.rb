module Exercise
  module Fp2
    class MyArray < Array
      # Использовать стандартные функции массива для решения задач нельзя.
      # Использовать свои написанные функции для реализации следующих - можно.

      # Написать свою функцию my_each
      def my_each
        for el in self
          yield el
        end
      end

      # Написать свою функцию my_map
      def my_map
        result = MyArray.new
        for el in self
          result << yield(el)
        end
        result
      end

      # Написать свою функцию my_compact
      def my_compact
        result = MyArray.new
        for el in self
          result << el if !el.nil?
        end
        result
      end

      # Написать свою функцию my_reduce
      def my_reduce(acc = nil)
        my_each { |el| acc = acc ? yield(acc, el) : el }
        acc
      end
    end
  end
end
