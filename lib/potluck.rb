require 'pry'

class Potluck
    attr_accessor :date, :dishes

    def initialize(date)
        @date = date
        @dishes = []
    end

    def add_dish(dish)
        @dishes << dish
    end

    def get_all_category
        @categories = []

        @dishes.each do |dish|
            @categories << dish.category
        end

        return @categories|[]
    end

    def get_all_from_category(category)
        dish_holder = []

        @dishes.each do |dish|
            if dish.category == category
                dish_holder << dish
            end
        end

        dish_holder
    end

    def menu

    end

    def ratio(category)
        total_dishes = @dishes.length
        category_dishes = 0

        @dishes.each do |dish|
            if dish.category == category
                category_dishes += 1
            end
        end

        (category_dishes.to_f/total_dishes.to_f) * 100.0
    end
end