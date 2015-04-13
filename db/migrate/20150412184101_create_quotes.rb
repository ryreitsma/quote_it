class CreateQuotes < ActiveRecord::Migration
  def change
    create_table :quotes do |t|
      t.text :content
      t.string :subtitle
      t.references :author, index: true
      t.timestamps null: false
    end
  end
end
