class AddRatingtoMovies < ActiveRecord::Migration[7.1]
  def change
    add_column :movies, :rating, :integer
  end
end
