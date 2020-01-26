#
# Cookbook Name:: mkuser
# Recipe:: default
#
# Copyright 2020, OpenWorks
#
# All rights reserved - Do Not Redistribute
users_manage 'deployer' do
  action [ :remove, :create ]
end

