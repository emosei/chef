#
# Cookbook Name:: set-iptables
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
include_recipe "nginx"
include_recipe "iptables"

iptables_rule "ssh"
iptables_rule "http"

