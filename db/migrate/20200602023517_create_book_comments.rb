class CreateBookComments < ActiveRecord::Migration[5.0]
  def change
    create_table :book_comments do |t|
      t.text :body
      t.integer :user_id
      t.integer :book_id

      t.timestamps
    end
  end
end
