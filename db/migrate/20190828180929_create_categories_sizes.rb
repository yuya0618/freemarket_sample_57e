class CreateCategoriesSizes < ActiveRecord::Migration[5.2]
  def change
    create_table :categories_sizes do |t|
      t.references    :category,  null: false, foreign_key: true
      t.references    :size,  null: false, foreign_key: true
      t.timestamps
    end
  end
end
