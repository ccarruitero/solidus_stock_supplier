class CreateSuppliers < SolidusSupport::Migration[4.2]
  def change
    create_table :spree_suppliers do |t|
      t.string :email
      t.string :phone
      t.string :name
      t.string :uid
      t.boolean :active, default: true
    end
  end
end
