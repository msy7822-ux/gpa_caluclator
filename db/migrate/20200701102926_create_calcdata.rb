class CreateCalcdata < ActiveRecord::Migration[5.2]
  def change
    create_table :calcdata do |t|
      t.integer :classnum
      t.string :gradekind

      t.timestamps
    end
  end
end
