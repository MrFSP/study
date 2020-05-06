module Exercise
  module Fp
    class << self
      # Обратиться к параметрам фильма можно так:
      # film["name"], film["rating_kinopoisk"], film["rating_imdb"],
      # film["genres"], film["year"], film["access_level"], film["country"]
      def rating(_array)
        films = _array
          .filter { |film| film["rating_kinopoisk"] && film["rating_kinopoisk"].to_f > 0 }
          .filter { |film| film["country"] && film["country"].split(',').count() >= 2 }
        rating = films
          .reduce(0) { |sum, film| sum + film["rating_kinopoisk"].to_f }
        return rating / films.count
      end

      def chars_count(_films, _threshold)
        _films
          .filter { |film| film["rating_kinopoisk"] && film["rating_kinopoisk"].to_f > _threshold }
          .reduce(0) { |count, film| count + film["name"].count("и") }
      end
    end
  end
end
