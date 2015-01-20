class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.text :title
      t.text :format
      t.integer :length
      t.integer :release_year
      t.integer :rating

      t.timestamps
    end
  end
end
