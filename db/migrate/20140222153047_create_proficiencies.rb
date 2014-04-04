class CreateProficiencies < ActiveRecord::Migration
  def change
    create_table :proficiencies do |t|
      t.belongs_to :user, null: false
      t.belongs_to :skill, null: false
      t.integer :rating, default: 0

      t.timestamps
    end
  end
end
