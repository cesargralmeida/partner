class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.belongs_to :request, index: true
      t.string :name
      t.integer :quantity

      t.timestamps
    end
  end
end
