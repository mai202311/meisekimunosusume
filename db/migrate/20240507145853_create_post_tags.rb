class CreatePostTags < ActiveRecord::Migration[6.1]
  def change
    create_table :post_tags do |t|
      t.references :post,      foreign_key: true
      t.references :tag,       foreign_key: true

      t.timestamps
    end
      add_index :post_tags, [:post_id, :tag_id], unique: true
      #投稿に同じタグは２つつけられないようにするための複合ユニーク制約
  end
end
