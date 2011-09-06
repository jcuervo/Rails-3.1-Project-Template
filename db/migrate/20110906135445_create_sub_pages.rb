class CreateSubPages < ActiveRecord::Migration
  def change
    create_table :sub_pages do |t|
      t.integer :page_id
      t.string :title
      t.text :content
      t.string :browser_title
      t.string :meta_keywords
      t.string :meta_description

      t.timestamps
    end
  end
end
