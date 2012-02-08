require 'spec_helper'

describe ExerciseCategory do
	before(:each) do
    @exercise = Factory(:exercise)
    @category = Factory(:category)
 
    
  end
 
  it "should create a new instance given valid attributes" do
  	@exercise_category = @category.category_exercises.build(:exercise_id => @exercise.id)
    @exercise_category.save!
  end
  
  describe "category methods" do

    before(:each) do
    	@exercise_category = @category.category_exercises.build(:exercise_id => @exercise.id)
      @exercise_category.save
    end

    it "should have an exercise attribute" do
      @exercise_category.should respond_to(:exercise)
    end

    it "should have the right exercise" do
      @exercise_category.exercise.should == @exercise
    end

    it "should have a category attribute" do
      @exercise_category.should respond_to(:category)
    end

    it "should have the right category" do
      @exercise_category.category.should == @category
    end
    describe "validations" do

		  it "should require a category_id" do
		    @exercise_category.category_id = nil
		    @exercise_category.should_not be_valid
		  end

		  it "should require a exercise_id" do
		    @exercise_category.exercise_id = nil
		    @exercise_category.should_not be_valid
		  end
  	end
  end
  
  
end
