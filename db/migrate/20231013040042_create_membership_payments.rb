class CreateMembershipPayments < ActiveRecord::Migration[7.0]
  def change
    create_table :membership_payments do |t|
      t.references :user,            null: false, foreign_key: true
      t.references :membership_plan, null: false, foreign_key: true
      t.timestamps
    end
  end
end
