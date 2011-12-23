#
# Cookbook Name:: block_device_ext
# Recipe:: default
#
# Copyright 2011, Pearson
#
# All rights reserved - Do Not Redistribute
#

puts 'Block Device Ext :: default'
puts "node #{node[:block_device][:storage_type]}"
include_recipe "block_device::setup_block_device" 
