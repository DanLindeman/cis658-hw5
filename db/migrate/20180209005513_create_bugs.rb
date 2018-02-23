class CreateBugs < ActiveRecord::Migration[5.1]
  def change
    create_table :bugs do |t|
      t.string :title
      t.text :description
      t.integer :issue_type, default: 0
      t.integer :priority, default: 1
      t.integer :status, default: 0

      t.timestamps
    end
  end
end
