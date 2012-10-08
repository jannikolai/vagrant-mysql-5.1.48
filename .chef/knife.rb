log_level                :info
log_location             STDOUT
# The following does not make much sense because we only run chef solo
node_name `hostname`
validation_client_name   ''
validation_key           ''
chef_server_url          ''
## end of nonsene stuff
cache_type               'BasicFile'
cache_options( :path => 'checksums' )
cookbook_path [ './cookbooks' ]
