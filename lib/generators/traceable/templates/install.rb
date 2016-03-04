class <%= migration_class_name %> < ActiveRecord::Migration

    ActiveRecord::Base.establish_connection("traceable_#{Rails.env}").connection

    def change
      create_table :traceables, force: true do |t|
        t.column :traceable_id, :integer
        t.column :traceable_type, :string
        t.column :user_id, :integer
        t.column :user_type, :string
        t.column :username, :string
        t.column :action, :string
        t.column :tracked_changes, :text
        t.column :version, :integer, :default => 0
        t.column :created_at, :datetime
      end

      add_index :traceables, [:traceable_id, :traceable_type], :name => 'associated_index'
      add_index :traceables, [:user_id, :user_type], :name => 'user_index'
      add_index :traceables, :created_at

    end

    def self.down
      drop_table :traceables
    end
    
end