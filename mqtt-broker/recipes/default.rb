#
# Cookbook Name:: mqtt-broker
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

apt_repository "mosquitto" do
  uri "http://ppa.launchpad.net/mosquitto-dev/mosquitto-ppa/ubuntu"
  distribution node['lsb']['codename']
  components ["main"]
  keyserver "keyserver.ubuntu.com"
  key "262C4500"
end

package "mosquitto" do
    action :install
end

cookbook_file "pumpwell.ca.bundledca.crt" do
  backup false
  path "/etc/mosquitto/pumpwell.ca.bundledca.crt"
  action :create_if_missing
end

cookbook_file "pumpwell.ca.pem" do
  backup false
  path "/etc/mosquitto/pumpwell.ca.pem"
  action :create_if_missing
end

cookbook_file "pumpwell.ca.crt" do
  backup false
  path "/etc/mosquitto/pumpwell.ca.crt"
  action :create_if_missing
end

template "/etc/mosquitto/mosquitto.conf" do
  source "mosquitto.conf.erb"

  mode 0640

  notifies :reload, "service[mosquitto]"
end

service 'mosquitto' do
  service_name 'mosquitto'

  supports status => true, reload => true

  action :nothing
end

include_recipe 'mqtt-broker::client'

service 'mosquitto' do
  action :start
end