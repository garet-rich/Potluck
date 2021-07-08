require 'rspec'
require './lib/dish'

describe Dish do
    describe '#initialize' do
        it 'is an instance of dish' do
            dish = Dish.new("Hamburger", :lunch)
            expect(dish).to be_a Dish
        end

        it 'has a name' do
            dish = Dish.new("Hamburger", :lunch)
            expect(dish.name).to eq "Hamburger"
        end

        it 'has a category' do
            dish = Dish.new("Hamburger", :lunch)
            expect(dish.category).to eq :lunch
        end
    end
end