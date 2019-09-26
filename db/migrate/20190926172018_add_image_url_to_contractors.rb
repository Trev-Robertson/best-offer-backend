class AddImageUrlToContractors < ActiveRecord::Migration[5.2]
  def change
    add_column :contractors, :img_url, :string
  end
end
