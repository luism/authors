class CreatePublications < ActiveRecord::Migration[5.2]
  def change
    create_table :publications do |t|
      t.text :body
      t.string :title
      t.datetime :publication_date
      t.references :author, foreign_key: true

      t.timestamps
    end
  end
end
