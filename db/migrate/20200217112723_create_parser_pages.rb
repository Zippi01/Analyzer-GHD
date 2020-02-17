class CreateParserPages < ActiveRecord::Migration[6.0]
  def change
    create_table :parser_pages do |t|
      t.string :url

      t.timestamps
    end
  end
end
