include_recipe "mysql::server"
include_recipe "database::mysql"

sql_info_hash = {:host => "localhost",
                :username => 'root',
                :password => node['mysql']['server_root_password']
}

mysql_database 'ct3k' do
	connection sql_info_hash
	action :create
end

mysql_database_user 'root' do
	connection sql_info_hash
	password node['mysql']['user_password']
	host '%'
	privileges [:all]
	action :grant
end

mysql_database_user 'root' do
	connection sql_info_hash
	host 'localhost'
	privileges [:all]
	action :grant
end