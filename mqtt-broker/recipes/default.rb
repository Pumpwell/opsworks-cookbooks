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

include_recipe 'mosquitto::service'

template "/etc/mosquitto/mosquitto.conf" do
  source "mosquitto.conf.erb"
  mode 0640
  notifies :reload, "service[mosquitto]"
end

service 'mosquitto' do
  action [:enable, :start]
end