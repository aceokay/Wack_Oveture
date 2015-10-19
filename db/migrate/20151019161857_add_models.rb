class AddModels < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.column :name, :string
      t.column :email, :string
      t.column :password_hash, :string
      t.column :password_salt, :string

      t.timestamps
    end

    create_table :questions do |t|
      t.column :title, :string
      t.column :body, :string
      t.column :user_id, :integer

      t.timestamps
    end

    create_table :answers do |t|
      t.column :body, :string
      t.column :user_id, :integer

      t.timestamps
    end

    create_table :comments do |t|
      t.column :body, :string
      t.column :user_id, :integer
      t.column :question_id, :integer
      t.column :answer_id, :integer

      t.timestamps
    end

    create_table :tags_questions, id: false do |t|
      t.belongs_to :tag, index: true
      t.belongs_to :question, index: true
    end
  end
end
