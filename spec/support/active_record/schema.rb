# frozen_string_literal: true

ActiveRecord::Schema.define do
  create_table :dogs do |t|
    t.column :first_name, :string
    t.column :last_name, :string
    t.column :created_at, :datetime
    t.column :updated_at, :datetime
  end
end
