ActiveRecord::Schema.define do
  create_table :users do |t|
    t.string :name
  end
  create_table :clients do |t|
    t.string :name
  end
  create_table :employees do |t|
    t.string :email
  end
end
