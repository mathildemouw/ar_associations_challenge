class User < ActiveRecord::Base
  has_many :proficiencies
  has_many :skills, through: :proficiencies

  def proficiency_for(skill)
    Proficiency.where(user_id: self.id, skill_id: skill.id).first.rating
  end

  def set_proficiency_for(skill, rating)
    @skill = skill
    @rating = rating
    @proficiency = Proficiency.where(user_id: self.id, skill_id: skill.id).first
      if @proficiency
        update_proficiency
      else
        set_initial_proficiency
      end
  end

  def set_initial_proficiency
    Proficiency.create(user_id: self.id, skill_id: @skill.id, rating: @rating)
  end

  def update_proficiency
    @proficiency.rating = @rating
    @proficiency.save
  end
end
