class CreateRequests < ActiveRecord::Migration[5.2]
  def change
    create_table :requests do |t|
      t.belongs_to :partner, index: true
      t.integer :organization_id, default: 0
      t.string :comments

      t.timestamps
    end
  end
end
