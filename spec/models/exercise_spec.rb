require 'spec_helper'

describe Exercise do

	before(:each) do
		@attr = {:name => "Deadlift", :description => "a"*256 }
	end
	
	describe "exercise/category relationship" do

    before(:each) do
      @exercise = Exercise.create!(@attr)
      @category = Factory(:category)
    end
		
		it "should have an exercise_categories method" do
      @exercise.should respond_to(:exercise_categories)
    end

    it "should have a categories method" do
      @exercise.should respond_to(:categories)
    end

    it "should include the category in the categories array" do
      @exercise.include_category!(@category)
      @exercise.categories.should include(@category)
    end
	end
end
