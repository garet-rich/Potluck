require 'rspec'
require './lib/potluck'
require './lib/dish'

describe Potluck do
    describe '#initialize' do
        it 'is an instance of potluck' do
            potluck = Potluck.new('7-8-1984')
            expect(potluck).to be_a Potluck
        end

        it 'has a date' do
            potluck = Potluck.new('2-14-2001')
            expect(potluck.date).to eq '2-14-2001'
        end

        it 'has dishes' do
            potluck = Potluck.new('2-14-2001')
            expect(potluck.dishes).to eq []
        end
    end

    describe '#add_dish' do
        it 'add dishes to dish array' do
            potluck = Potluck.new('2-14-2001')
            breakfast = Dish.new("French Toast", :breakfast)
            potluck.add_dish(breakfast)

            expect(potluck.dishes.length).to eq 1
        end
    end

    describe '#get_all_from_category' do
        it 'returns all dishes of a category' do
            potluck = Potluck.new('2-14-2001')
            omelette = Dish.new("Omelette", :breakfast)
            hash_browns = Dish.new("Hash Browns", :breakfast)
            potluck.add_dish(omelette)
            potluck.add_dish(hash_browns)

            expect(potluck.get_all_from_category(:breakfast).length).to eq 2
        end
    end

    describe '#menu' do
        it 'returns a hash of all dishes separated by category into arrays' do
            potluck = Potluck.new('2-14-2001')
            omelette = Dish.new("Omelette", :breakfast)
            hash_browns = Dish.new("Hash Browns", :breakfast)
            shrimp_scampi = Dish.new("Shimp Scampi", :lunch)
            salad = Dish.new("Salad", :lunch)
            potluck.add_dish(omelette)
            potluck.add_dish(hash_browns)
            potluck.add_dish(shrimp_scampi)
            potluck.add_dish(salad)

            expect(potluck.menu).to eq :breakfast => ["Omelette", "Hash Browns"], :lunch => ["Shimp Scampi", "Salad"]
        end
    end

    describe '#ratio' do
        it 'returns percentage of dishes that match a category' do
            potluck = Potluck.new('2-14-2001')
            omelette = Dish.new("Omelette", :breakfast)
            hash_browns = Dish.new("Hash Browns", :breakfast)
            shrimp_scampi = Dish.new("Shimp Scampi", :lunch)
            salad = Dish.new("Salad", :lunch)
            potluck.add_dish(omelette)
            potluck.add_dish(hash_browns)
            potluck.add_dish(shrimp_scampi)
            potluck.add_dish(salad)

            expect(potluck.ratio(:breakfast)).to eq 50.0
        end
    end
end