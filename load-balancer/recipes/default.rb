#
# Cookbook Name:: load-balancer
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

cookbook_file "/usr/local/etc/server.pem" do
  source "server.pem"
  mode 0755
  owner "root"
  group "root"
  action :create
end

cookbook_file "/usr/local/etc/pumpwell.ca.bundledca.crt" do
  source "pumpwell.ca.bundledca.crt"
  mode 0755
  owner "root"
  group "root"
  action :create
end

cookbook_file "/usr/local/etc/pumpwell.ca.pem" do
  source "pumpwell.ca.pem"
  mode 0755
  owner "root"
  group "root"
  action :create
end

cookbook_file "/usr/local/etc/pumpwell.ca.crt" do
  source "pumpwell.ca.crt"
  mode 0755
  owner "root"
  group "root"
  action :create
end