class CreateMembershipPlans < ActiveRecord::Migration[7.0]
  def change
    create_table :membership_plans do |t|
      t.integer :monthly_fee_id, null: false
      t.integer :yearly_fee_id,  null: false
      t.timestamps
    end
  end
end
