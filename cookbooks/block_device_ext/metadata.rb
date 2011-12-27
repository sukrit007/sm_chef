maintainer       "Pearson"
maintainer_email "sukrit007@gmail.com"
license          "All rights reserved"
description      "Installs/Configures block_device_ext"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
depends		 "block_device"
version          "0.0.1"

recipe  "block_device_ext::default", "Default recipe for block_device_ext"


attribute "block_device_ext/create_mode",
  :display_name => "Block Device Create Mode (create or restore)", 
  :description => "Mode for Block Device Ext. create: creates new block store    restore: restore from existing snapshot",
  :required => true,
  :choice => ["create", "restore"],
  :type => "string",  
  :recipes => ["block_device_ext::default"]









