#
# Cookbook Name:: time-zone
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
# タイムゾーン変更
execute "change-server-localtime" do
  user "root"
  command "sudo ln -s -f /usr/share/zoneinfo/UTC /etc/localtime"
  action :run
end

# clockをUTCに固定
cookbook_file "/etc/sysconfig/clock" do
  owner "root"
  group "root"
  mode 0755
  source "clock-utc"
end
