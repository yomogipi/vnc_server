#
# Cookbook Name:: vnc_server
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

package "tightvncserver" do
  action :install
end

template "/etc/init.d/vncboot" do
  source "vncboot.erb"
  mode "0755"
end

service "vncboot" do
  supports :start => true, :stop => true, :restart => true
  action [:start, :enable]
  subscribes :restart, "template[/etc/init.d/vncboot]", :immediately 
end
