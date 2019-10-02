class AddPhoneNumberToContractors < ActiveRecord::Migration[5.2]
  def change
    add_column :contractors, :phone_number, :string
  end
end
