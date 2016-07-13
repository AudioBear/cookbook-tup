include_recipe "build-essential"

%w{libfuse-dev pkg-config}.each do |pkg|
  package pkg
end

tup_src = "/opt/tup-src"

git tup_src do
  repo "https://github.com/gittup/tup.git"
  revision node[:tup][:revision]
  notifies :run, "bash[bootstrap_install_tup]", :immediately
end

bash "bootstrap_install_tup" do
  cwd tup_src
  code "git clean -fxd && ./bootstrap.sh && cp ./tup /usr/local/bin/ && git rev-parse HEAD > /usr/local/share/tup-version"
  not_if '[ -f /usr/local/share/tup-version ] && [ "$(git rev-parse HEAD)" = "$(cat /usr/local/share/tup-version)" ]', :cwd => tup_src
end

