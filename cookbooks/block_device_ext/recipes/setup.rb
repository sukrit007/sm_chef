#
# Cookbook Name:: block_device_ext
# Recipe:: default
#
# Copyright 2011, Pearson
#
# All rights reserved - Do Not Redistribute
#

Chef::Log.info("Block Device Ext :: setup for mode: #{node[:block_device_ext][:create_mode]}")

#Check if volume group vg-rightscale already exists
system 'lvm lvscan | grep vg-rightscale'

if $?.to_i == 0
	Chef::Log.info("Volume Group vg-rightscale already exists. Skip setup.")	
else
	create_mode = "#{node[:block_device_ext][:create_mode]}"
	case create_mode
		when "create" then
			include_recipe "block_device::setup_block_device"
		when "restore" then
			include_recipe "block_device::do_restore"
		else
			Chef::Log.error("Option not supported")		
	end
end
	
