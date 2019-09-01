#
# Cookbook Name:: set-iptables
# Recipe:: default
#
# Copyright 2019, OpenWorks
#
# All rights reserved - Do Not Redistribute
#
include_recipe "nginx"
include_recipe "iptables"

iptables_rule "ssh"
iptables_rule "http"

