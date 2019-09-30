class AddPasswordDigestToContractors < ActiveRecord::Migration[5.2]
  def change
    add_column :contractors, :password_digest, :string
  end
end
