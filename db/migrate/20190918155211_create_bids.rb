class CreateBids < ActiveRecord::Migration[5.2]
  def change
    create_table :bids do |t|
      t.references :task, foreign_key: true
      t.references :contractor, foreign_key: true
      t.integer :price
      t.boolean :status, default: false

      t.timestamps
    end
  end
end
