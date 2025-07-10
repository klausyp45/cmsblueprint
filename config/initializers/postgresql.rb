if Rails.env.production?
  module ActiveRecord
    module ConnectionHandling
      def postgresql_connection(config)
        config[:host] ||= ENV['DATABASE_URL'] ? URI.parse(ENV['DATABASE_URL']).hostname : 'localhost'
        config[:port] ||= ENV['DATABASE_URL'] ? URI.parse(ENV['DATABASE_URL']).port : 5432
        config[:socket] = nil # Forcefully disable socket
        
        conn_params = config.symbolize_keys
        
        conn_params[:user] = ENV['DATABASE_URL'] ? URI.parse(ENV['DATABASE_URL']).user : 'postgres'
        conn_params[:password] = ENV['DATABASE_URL'] ? URI.parse(ENV['DATABASE_URL']).password : ''
        
        ConnectionAdapters::PostgreSQLAdapter.new(conn_params)
      end
    end
  end
end