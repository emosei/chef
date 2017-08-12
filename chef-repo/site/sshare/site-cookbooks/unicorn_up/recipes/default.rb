#
# Cookbook Name:: unicorn_up
# Recipe:: default
#
# Copyright 2016, OpenWorks
#
# All rights reserved - Do Not Redistribute
#

unicorn_app_service = "#{node['unicorn']['service_name']}"
 
template "/etc/init.d/#{unicorn_app_service}" do
  source "unicorn_app.erb"
  owner 'root'
  group 'root'
  mode "0755"
end
 
bash "make_pids_dir" do
  not_if { ::File.exists?(::File.join('/home', node['user'], node['rails']['project_dir'], node['rails']['app_dir'], 'tmp/pids')) }
  code <<-EOC
    mkdir #{::File.join('/home', node['user'], node['rails']['project_dir'], node['rails']['app_dir'], 'tmp/pids')}
    chown #{node['user']}:#{node['user']} #{::File.join('/home', node['user'], node['rails']['project_dir'], node['rails']['app_dir'], 'tmp/pids')}
  EOC
end

bash "add_unicorn_app_service" do
  not_if "chkconfig --list | grep #{unicorn_app_service} | grep 3:on"
  code <<-EOC
    chkconfig --add #{unicorn_app_service}
    chkconfig #{unicorn_app_service} on
  EOC
end
