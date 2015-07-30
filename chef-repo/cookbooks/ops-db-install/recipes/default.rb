#
#cookbook Name:: ops-db-install
#Recipe:: default

#Copyright (c) 2015 The Authors, All Rights Reserved.
include_recipe "chef-sugar"
include_recipe "apt"
include_recipe "build-essential"
include_recipe "openssl"
include_recipe "postgresql"
include_recipe "database::postgresql"

mysql_connection_info = {:host => '127.0.0.1',
			 :port => '3306',
			 :username => 'root',
			 :password => 'active123'}

#yum_package 'mysql' do
# action :install
#end
#
#yum_package 'mysql-server.x86_64' do
# action :install
#end
#

#yum_package 'nagios-plugins-all' do
# action :install
#end

#template '/etc/my.cnf' do
# source 'my.cnf.erb'
#end

#service 'mysqld' do
# action :start
#end

mysql2_chef_gem 'default' do
 action :install
end

mysql_database 'grace' do
 connection mysql_connection_info
 action :create
end

