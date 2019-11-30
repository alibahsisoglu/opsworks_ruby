# frozen_string_literal: true

module Drivers
  module Db
    class Postgresql < Base
      adapter :postgresql
      allowed_engines :postgres, :postgresql, :'aurora-postgresql'
      packages debian: 'libpq-dev', rhel: 'postgresql-devel'

      def setup
        context.execute 'amazon-linux-extras install postgresql10' if node['platform'] == 'amazon'
        super
      end
    end
  end
end
