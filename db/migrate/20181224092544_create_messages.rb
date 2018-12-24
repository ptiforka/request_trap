class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.text :method
      t.text :ip
      t.text :scheme
      t.text :query_parameters
      t.text :query
      t.text :cookies
      t.text :headers
      t.text :trap_id

      t.timestamps
    end
  end
end
