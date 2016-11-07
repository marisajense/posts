class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.text :body
      t.string :title
      t.string :author
      t.boolean :public

      t.timestamps
    end
  end
end

# This is the migration file that updates to DB
# Rails is a webserver
# Postgres is a database server running on a different port
