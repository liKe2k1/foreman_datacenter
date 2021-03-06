class CreateComments < ActiveRecord::Migration[4.2]
  def change
    create_table :comments do |t|
      t.text :content
      t.belongs_to :commentable, polymorphic: true

      t.timestamps null: false
    end
    add_index :comments, [:commentable_id, :commentable_type], name: 'comments_index'
  end
end
