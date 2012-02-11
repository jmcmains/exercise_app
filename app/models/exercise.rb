class Exercise < ActiveRecord::Base

	validates :name, :presence => true
	
  has_many :exercise_categories, :foreign_key => "exercise_id",
                                 :dependent => :destroy
  has_many :categories, :through => :exercise_categories
  
  has_many :exercise_accessories, :foreign_key => "exercise_id",
                                 :dependent => :destroy
  has_many :accessories, :through => :exercise_accessories
  
  has_many :exercise_positions, :foreign_key => "exercise_id",
                                 :dependent => :destroy
                                 
  has_many :positions, :through => :exercise_positions
  
 	has_many :exercise_heights, :foreign_key => "exercise_id",
                                 :dependent => :destroy
  has_many :heights, :through => :exercise_heights
  
  has_many :exercise_muscles, :foreign_key => "exercise_id",
                                 :dependent => :destroy
                                 
  has_many :muscles, :through => :exercise_muscles
  
  has_many :exercise_forces, :foreign_key => "exercise_id",
                                 :dependent => :destroy
                                 
  has_many :forces, :through => :exercise_forces
  
  has_many :exercise_posts, :foreign_key => "exercise_id",
                                 :dependent => :destroy
                                 
  has_many :posts, :through => :exercise_posts
  
  has_many :videos, :dependent => :destroy
  
  has_many :tips, :dependent => :destroy
  
  has_many :variations, :dependent => :destroy
  
  searchable do
		text :name, :description, :boost => 5.0
		text :category_names do
			categories.map { |category| category.name }
		end
		text :accessory_names do
			accessories.map { |accessory| accessory.name}
		end
		text :position_names do
			positions.map { |position| position.name }
		end
		text :height_names do
			heights.map { |height| height.name }
		end
		text :muscle_names do
			muscles.map { |muscle| muscle.name}
		end
		text :force_names do
			forces.map { |force| force.name }
		end
		text :post_names do
			posts.map { |post| post.name }
		end
		text :tips_content do
			tips.map { |tip| tip.content }
		end
		text :variation_content do
			variations.map { |variation| variation.content }
		end
	end
  
  #Categories
  def included_category?(category)
    exercise_categories.find_by_category_id(category)
  end

  def include_category!(category)
    exercise_categories.create!(:category_id => category.id)
  end
  
  def include_category_id!(category_id)
    exercise_categories.create!(:category_id => category_id)
  end
  
	def exclude_category!(category)
    exercise_categories.find_by_category_id(category).destroy
  end
  
  #Accessories
  def included_accessory?(accessory)
    exercise_accessories.find_by_accessory_id(accessory)
  end

  def include_accessory!(accessory)
    exercise_accessories.create!(:accessory_id => accessory.id)
  end
  
  def include_accessory_id!(accessory_id)
    exercise_accessories.create!(:accessory_id => accessory_id)
  end
  
	def exclude_accessory!(accessory)
    exercise_accessories.find_by_accessory_id(accessory).destroy
  end
  
  def primary_accessory?(accessory_id)
  	exercise_accessories.find_by_accessory_id(accessory_id).primary
  end  
  
  #Positions
  def included_position?(position)
    exercise_positions.find_by_position_id(position)
  end

  def include_position!(position)
    exercise_positions.create!(:position_id => position.id)
  end
  
  def include_position_id!(position_id)
    exercise_positions.create!(:position_id => position_id)
  end
  
	def exclude_position!(position)
    exercise_positions.find_by_position_id(position).destroy
  end
  
  #Anchor Point Heights
  def included_height?(height)
    exercise_heights.find_by_height_id(height)
  end

  def include_height!(height)
    exercise_heights.create!(:height_id => height.id)
  end
  
  def include_height_id!(height_id)
    exercise_heights.create!(:height_id => height_id)
  end
  
	def exclude_height!(height)
    exercise_heights.find_by_height_id(height).destroy
  end
  
  #Target Muscles
  def included_muscle?(muscle)
    exercise_muscles.find_by_muscle_id(muscle)
  end

  def include_muscle!(muscle)
    exercise_muscles.create!(:muscle_id => muscle.id)
  end
  
  def include_muscle_id!(muscle_id)
    exercise_muscles.create!(:muscle_id => muscle_id)
  end
  
	def exclude_muscle!(muscle)
    exercise_muscles.find_by_muscle_id(muscle).destroy
  end
  
  def toggle_primary!(muscle_id)
  	exercise_muscles.find_by_muscle_id(muscle_id).toggle!(:primary)
  end
  
  def primary_muscle?(muscle_id)
  	exercise_muscles.find_by_muscle_id(muscle_id).primary
  end  
  
  #Forces
  def included_force?(force)
    exercise_forces.find_by_force_id(force)
  end

  def include_force!(force)
    exercise_forces.create!(:force_id => force.id)
  end
  
  def include_force_id!(force_id)
    exercise_forces.create!(:force_id => force_id)
  end
  
	def exclude_force!(force)
    exercise_forces.find_by_force_id(force).destroy
  end
  
 	#Posts
  def included_post?(post)
    exercise_posts.find_by_post_id(post)
  end

  def include_post!(post)
    exercise_posts.create!(:post_id => post.id)
  end
  
  def include_post_id!(post_id)
    exercise_posts.create!(:post_id => post_id)
  end
  
	def exclude_post!(post)
    exercise_posts.find_by_post_id(post).destroy
  end
end


