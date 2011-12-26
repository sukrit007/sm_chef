#
# Cookbook Name:: block_device_ext
# Recipe:: default
#
# Copyright 2011, Pearson
#
# All rights reserved - Do Not Redistribute
#

Chef::Log.info("Block Device Ext :: default for mode: #{node[:block_device_ext][:create_mode]}")
Chef::Log.info("node #{node[:block_device][:storage_type]}"

if node[:block_device][:storage_type] == "create"
	include_recipe "block_device::setup_block_device"
else
	include_recipe "block_device::do_restore"
end
	