class UpdateJoinTable < ActiveRecord::Migration
  def change
    drop_table :tags_questions
    create_table :questions_tags, id: false do |t|
      t.belongs_to :question, index: true
      t.belongs_to :tag, index: true
    end
  end
end
