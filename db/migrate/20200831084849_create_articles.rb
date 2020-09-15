class CreateArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :articles do |t|
      t.string :country
      t.string :city
      t.string :candidate_name
      t.string :skills
      t.string :email
      t.string :phone

      t.timestamps
    end
  end
end
