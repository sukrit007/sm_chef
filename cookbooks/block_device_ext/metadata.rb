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


attribute "block_device/timestamp_override",
  :display_name => "Restore Timestamp Override", 
  :description => "Another optional variable to restore from a specific timestamp. Specify a string matching the timestamp tags on the volume snapshot set.  You will need to specify the timestamp that's defined by the snapshot's tag (not name).  For example, if the snapshot's tag is 'rs_backup:timestamp=1303613371' you would specify '1303613371' for this input.",
  :required => false,
  :recipes => ["block_device_ext::default"]

attribute "block_device/stripe_count",
  :display_name => "Number of Volumes in the Stripe", 
  :description => "The total number of volumes in the LVM volume stripe that will be used by the database.  Volumes will be created and mounted to the instance.  By default, a value of '1' will be used, which means only a single volume will be used (no striping).  Only the predefined options have been tested.",
  :default => "1",
  :required => false,
  :recipes => ["block_device_ext::default"]

attribute "block_device/volume_size",
  :display_name => "Total Volume Size", 
  :description => "Defines the total size of the LVM volume stripe set (in GB).  For example, if the stripe_count is '3' and you specify '3' for this attribute, it will create an LVM volume stripe that contains 3 volumes that are each 1GB in size.  If an uneven ratio is defined, volume sizes will be rounded up to the nearest whole integer.",
  :required => false,
  :default => "5",
  :recipes => ["block_device_ext::default"]

attribute "block_device/cron_backup_minute",
  :display_name => "Backup Cron Minute", 
  :description => "Defines the minute of the hour when the backup will be taken. Use a value 1-59, or set to 'Ignore' and a random minute will be calculated.",
  :required => false,
  :recipes => ["block_device_ext::default"]

attribute "block_device/cron_backup_hour",
  :display_name => "Backup Cron Hour",
  :description => "Defines the hour when the backup will be taken. Use a value 1-24, or set to 'Ignore' for every hour.",
  :required => false,
  :recipes => ["block_device_ext::default"]

attribute "block_device/rackspace_user",
  :display_name => "Rackspace User",
  :description => "In order to write the dump file to the specified cloud storage location, you will need to provide cloud authentication credentials. For Rackspace Cloud Files, use your Rackspace login Username.",
  :required => false,
  :recipes => ["block_device_ext::default"]

attribute "block_device/rackspace_secret",
  :display_name => "Rackspace Secret",
  :description => "In order to write the dump file to the specified cloud storage location, you will need to provide cloud authentication credentials. For Rackspace Cloud Files, use your Rackspace account API Key.",
  :required => false,
  :recipes => ["block_device_ext::default"]

attribute "block_device/aws_access_key_id",
  :display_name => "AWS Access Key Id",
 :description => "In order to write the dump file to the specified cloud storage location, you will need to provide cloud authentication credentials. For Amazon S3, use AWS_ACCESS_KEY_ID.",
  :required => false,
  :recipes => ["block_device_ext::default"]

attribute "block_device/aws_secret_access_key",
  :display_name => "Aws Secret Access Key",
  :description => "In order to write the dump file to the specified cloud storage location, you will need to provide cloud authentication credentials. For Amazon S3, use AWS_SECRET_ACCESS_KEY.",
  :required => false,
  :recipes => ["block_device_ext::default"]
 
attribute "block_device/storage_container",
  :display_name => "Remote Storage Container",
  :description => "The cloud storage location where the dump file will be saved to or restored from. For Amazon S3, use the bucket name.  For Rackspace Cloud Files, use the container name.  This input is ignored if using a 'Block Device Storage Type' of 'volume'.",
  :required => false,
  :recipes => ["block_device_ext::default"]

attribute "block_device/lineage",
  :display_name => "Lineage",
  :description => "The prefix that will be used to name/locate the backup of a particular database.",
  :required => true,
  :recipes => ["block_device_ext::default"]

attribute "block_device/max_snapshots",
  :display_name => "Max Snapshots",
  :description => "The maximum number of backups to keep in addition to those being rotated.",
  :default => "60",
  :required => false,
  :recipes => ["block_device_ext::default"]
  
attribute "block_device/keep_daily",
  :display_name => "Keep Daily Backups",
  :description => "The number of daily backups to keep (i.e. rotation size).",
  :default => "14",
  :required => false,
  :recipes => ["block_device_ext::default"]
  
attribute "block_device/keep_weekly",
  :display_name => "Keep Weekly Backups",
  :description => "The number of weekly backups to keep (i.e. rotation size).",
  :default => "6",
  :required => false,
  :recipes => ["block_device_ext::default"]

attribute "block_device/keep_monthly",
  :display_name => "Keep Monthly Backups",
  :description => "The number of monthly backups to keep (i.e. rotation size).",
  :default => "12",
  :required => false,
  :recipes => ["block_device_ext::default"]
  
attribute "block_device/keep_yearly",
  :display_name => "Keep Yearly Backups",
  :description => "The number of yearly backups to keep (i.e. rotation size).",
  :default => "2",
  :required => false,
  :recipes => ["block_device_ext::default"]

attribute "block_device/storage_type",
  :display_name => "Block Device Storage Type",
  :description => "Sets the cloud storage type.  For block devices (e.g. Volumes), use 'volume' as the type.  For remote object storage (e.g. Amazon S3 or RackSpace Cloud Files), use 'ros' as the type.",
  :type => "string",
  :choice => ["volume", "ros"],
  :required => true,
  :recipes => ["block_device_ext::default"]

attribute "block_device/mount_dir",
  :display_name => "Block Device Mount Directory",
  :description => "The directory to mount the block device on. Ex: /mnt/storage",
  :type => "string",
  :default => "/mnt/storage",
  :required => false,
  :recipes => ["block_device_ext::default"]

attribute "block_device/rackspace_snet",
  :display_name => "Rackspace SNET",
  :description => "Use Rackspace internal private networking (preferred)",
  :type => "string",
  :choice => ["true", "false"],
  :default => "true",
  :required => false,
  :recipes => ["block_device_ext::default"]





