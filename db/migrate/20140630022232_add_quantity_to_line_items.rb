class AddQuantityToLineItems < ActiveRecord::Migration
  def change
    add_column :line_items, :quantity {:default => 1}, :integer, 
  end
end
