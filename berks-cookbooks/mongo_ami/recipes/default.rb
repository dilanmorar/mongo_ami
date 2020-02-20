#
# Cookbook:: mongo_ami
# Recipe:: default
#
# Copyright:: 2020, The Authors, All Rights Reserved.

include_recipe 'apt'
include_recipe 'sc-mongodb'

template '/etc/mongod.conf' do
  source 'mongod.conf.erb'
  variables bindIp: node['mongodb']['config']['mongod']['net']['bindIp'],
  port: node['mongodb']['config']['mongod']['net']['port']
  notifies :restart, 'service[mongod]'
end

  #resource link
template "/lib/systemd/system/mongod.service" do
  source "mongod.service.erb"
    notifies :restart, 'service[mongod]'
end

service 'mongod' do
  action [:start, :enable]
end
