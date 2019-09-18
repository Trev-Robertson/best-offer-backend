class CreateJoinTableContractorSpecialty < ActiveRecord::Migration[5.2]
  def change
    create_join_table :contractors, :specialties do |t|
      t.index [:contractor_id, :specialty_id]
      # t.index [:specialty_id, :contractor_id]
    end
  end
end
