class CreateSeccalcs < ActiveRecord::Migration[5.2]
  def change
    create_table :seccalcs do |t|
      t.integer :s
      t.integer :a
      t.integer :b
      t.integer :c
      t.integer :d

      t.timestamps
    end
  end
end
