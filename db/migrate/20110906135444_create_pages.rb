class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.string :title
      t.text :content
      t.string :browser_title
      t.string :meta_keywords
      t.string :meta_description

      t.timestamps
    end
  end
end
