class CreateScaffolds < ActiveRecord::Migration[8.0]
  def change
    create_table :scaffolds do |t|
      t.string :users

      t.timestamps
    end
  end
end
