require 'rails/generators'
require 'rails/generators/migration'
require 'active_record'
require 'rails/generators/active_record'
require 'generators/traceable/migration'

module Traceable
  module Generators
    class InstallGenerator < Rails::Generators::Base
      include Rails::Generators::Migration
      extend Traceable::Generators::Migration

      source_root File.expand_path("../templates", __FILE__)

      def copy_initializer_file
        migration_template "install.rb", "db/migrate/create_traceables.rb"
      end

    end
  end
end