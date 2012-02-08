require 'spec_helper'

describe Category do
	before(:each) do
		@attr = {:name => "Legs"}
	end
	
	describe "exercise/category relationship" do

    before(:each) do
      @category = Category.create!(@attr)
      @exercise = Factory(:exercise)
    end

    it "should have a exercise/category relationships method" do
      @category.should respond_to(:category_exercises)
    end
    
    it "should have a included_exercise? method" do
      @category.should respond_to(:included_exercise?)
    end

    it "should have a include_exercise! method" do
      @category.should respond_to(:include_exercise!)
    end

    it "should include the exercise" do
      @category.include_exercise!(@exercise)
      @category.should be_included_exercise(@exercise)
    end

    it "should include the followed user in the following array" do
      @category.include_exercise!(@exercise)
      @category.exercises.should include(@exercise)
    end
    
    it "should have an exclude_exercise! method" do
      @category.should respond_to(:exclude_exercise!)
    end

    it "should exclude the exercise" do
      @category.include_exercise!(@exercise)
      @category.exclude_exercise!(@exercise)
      @category.should_not be_included_exercise(@exercise)
    end
  end
end
