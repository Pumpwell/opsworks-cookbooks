#
# Cookbook Name:: calcs
# Recipe:: default
#
# Copyright (C) 2013 YOUR_NAME
# 
# All rights reserved - Do Not Redistribute
#

cache_dir = "/var/cache"
tar_url = "http://sourceforge.net/projects/arma/files/armadillo-4.000.0.tar.gz"
tar_file = tar_url.split('/').last
tar_dir = tar_file.sub(/\.tar\.gz$/, '')

case node['platform_family']
when "debian"
    package "libcppunit-dev" do
        action :install
    end

    package "cmake" do
        action :install
    end

    package "libopenblas-dev" do
        action :install
    end

    package "liblapack-dev" do
        action :install
    end

    package "libarpack++2-dev" do
        action :install
    end

    #package "libarmadillo-dev" do
    #    action :install
    #end
end

directory cache_dir do
  owner       "root"
  group       "root"
  mode        "0755"
  recursive   true
  action      :create
end

remote_file "#{cache_dir}/#{tar_file}" do
  source      tar_url
  owner       "root"
  group       "root"
  mode        "0644"
end

execute "extract armadillo tarball" do
  user      "root"
  group     "root"
  cwd       cache_dir
  command   %{tar zxf #{tar_file}}
  creates   "#{cache_dir}/#{tar_dir}"
end

execute "compile armadillo" do
  user      "root"
  group     "root"
  cwd       "#{cache_dir}/#{tar_dir}"
  command   %{./configure && cmake . && make && make install && ldconfig}
end