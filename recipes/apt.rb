include_recipe "apt"

apt_repository "tup_anatol" do
  uri "http://ppa.launchpad.net/anatol/tup/ubuntu"
  distribution node['lsb']['codename']
  components ['main']
  keyserver "keyserver.ubuntu.com"
  key "486D3664"
  action :add
end

package "tup"

