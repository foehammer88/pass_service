class AddIpColumnToMessages < ActiveRecord::Migration
  def change
    add_column :messages, :ip, :string
  end
end
