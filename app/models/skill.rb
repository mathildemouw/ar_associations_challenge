class Skill < ActiveRecord::Base
  validates :name, uniqueness: true
  has_many :proficiencies
  has_many :users, through: :proficiencies

  def user_with_proficiency(rating)
    proficiency = Proficiency.where(skill_id: self.id, rating: rating).first
    User.find(proficiency.user_id)
  end
end
