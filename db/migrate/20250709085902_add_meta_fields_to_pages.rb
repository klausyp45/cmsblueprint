class AddMetaFieldsToPages < ActiveRecord::Migration[7.1]
  def change
    add_column :pages, :description, :string
    add_column :pages, :meta_description, :string
    add_column :pages, :page_type, :string
    add_column :pages, :status, :string
  end
end
