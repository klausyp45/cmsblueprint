class AddStatusAndFeaturedToPosts < ActiveRecord::Migration[7.1]
  def change
    add_column :posts, :status, :string, default: "draft", null: false
    add_column :posts, :featured, :boolean, default: false
  end
end
