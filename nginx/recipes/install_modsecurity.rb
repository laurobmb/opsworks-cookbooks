execute "Create ModSecurity dir" do
	command "mkdir -p /opt/modsec/"
	action :run
end

execute "Install depedences" do
	command "yum groupinstall 'Development Tools' -y"
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
	command "git submodule init;git submodule update;./build.sh;./configure;make;make install"
	cwd "/opt/modsec/ModSecurity"
	action :run
end

execute "owasp-modsecurity-crs" do
	command "git clone https://github.com/SpiderLabs/owasp-modsecurity-crs.git"
	cwd "/usr/local/nginx/conf/owasp-crs"
	action :run
end


