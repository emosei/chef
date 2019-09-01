#
# Cookbook Name:: setup_php
# Recipe:: default
#
# Copyright (C) 2019 
#
# 

#epel
package 'epel-release.noarch' do
  action :install
end

#remi
remote_file "#{Chef::Config[:file_cache_path]}/remi-release-7.rpm" do
    source "http://rpms.famillecollet.com/enterprise/remi-release-7.rpm"
    not_if "rpm -qa | grep -q '^remi-release'"
    action :create
    notifies :install, "rpm_package[remi-release]", :immediately
end

rpm_package "remi-release" do
    source "#{Chef::Config[:file_cache_path]}/remi-release-7.rpm"
    action :nothing
end


#php
package 'php' do
  flush_cache [:before]
  action :install
  options "--enablerepo=remi --enablerepo=remi-php70"
end

%w(php-openssl php-common php-fpm php-mysql php-mbstring php-gd php-xml).each do |pkg|
  package pkg do
    action :install
    options "--enablerepo=remi --enablerepo=remi-php70"
    notifies :restart, "service[php-fpm]"
  end
end

template '/etc/php-fpm.d/www.conf' do
  source 'www.conf.erb'
  owner 'root'
  group 'root'
  mode '0644'
  notifies :restart, 'service[php-fpm]'
end

service "php-fpm" do
  action [:enable, :start]
end

#composer
bash 'install_composer' do
  not_if { File.exists?("/usr/local/bin/composer") }
  user 'root'
  cwd '/tmp'
  code <<-EOH
    curl -sS https://getcomposer.org/installer | php -- --install-dir=/tmp
    mv /tmp/composer.phar /usr/local/bin/composer
  EOH
end

packages = %w(unzip fontconfig-devel)
packages.each do |pkg|
  package pkg do
    action :install
  end
end

