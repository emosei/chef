cookbook_path    ["cookbooks", "site-cookbooks", "../../berks-cookbooks", "../../cookbooks" ]  
node_path        "nodes"
role_path        "roles"
environment_path "environments"
data_bag_path    "data_bags"
encrypted_data_bag_secret ".chef/data_bag_key"

knife[:berkshelf_path] = "cookbooks"
Chef::Config[:ssl_verify_mode] = :verify_peer if defined? ::Chef
