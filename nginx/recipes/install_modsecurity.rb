package 'git' do
    action :install
  end  

execute "Create ModSecurity dir" do
	command "mkdir -p /opt/modsec/"
	action :run
end

execute "Install depedences" do
	command "# yum -y install lmdb lmdb-devel libxml2 libxml2-devel ssdeep ssdeep-devel lua lua-devel pcre-devel"
	action :run
end 

execute "Install depedences" do
	command "yum groupinstall 'Development Tools' -y"
	action :run
end

execute "Install depedences" do
	command "yum install -y gcc-c++ flex bison yajl yajl-devel curl-devel curl GeoIP-devel doxygen zlib-devel"
	action :run
end

execute "Download ModSecurity" do
	command "git clone https://github.com/SpiderLabs/ModSecurity.git"
	cwd "/opt/modsec/"
	action :run
end

execute "Download ModSecurity" do
	command "git clone https://github.com/SpiderLabs/ModSecurity-nginx.git"
	cwd "/opt/modsec/"
	action :run
end

execute "Builder ModSecurity" do
	command "./build.sh;git submodule init;git submodule update;./configure;make;make install"
	cwd "/opt/modsec/ModSecurity"
	action :run
end

execute "owasp-modsecurity-crs" do
	command "git clone https://github.com/SpiderLabs/owasp-modsecurity-crs.git"
	cwd "/usr/local/nginx/conf/owasp-crs"
	action :run
end


