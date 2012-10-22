maintainer       "Zahary Karadjov"
license          "Apache 2.0"
version          "0.1"

description      "Installs the tup build system"
# long_description IO.read(File.join(File.dirname(__FILE__), 'README.rdoc'))

%w{ubuntu}.each do |os|
  supports os
end

%w{git apt build-essential}.each do |dep|
  depends dep
end

attribute "tup/version",
  :display_name => "The version of tup to install",
  :default => "v0.6"

