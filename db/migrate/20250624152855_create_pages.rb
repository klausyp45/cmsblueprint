class CreatePages < ActiveRecord::Migration[7.1]
  def change
    create_table :pages do |t|
      t.string :title
      t.string :slug
      t.text :content
      t.boolean :published

      t.timestamps
    end
  end
end
