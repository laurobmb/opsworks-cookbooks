package 'git' do
    action :install
  end  

execute "Create ModSecurity dir" do
	command "mkdir -p /opt/modsec/"
	action :run
end

execute "Install depedences" do
	command "dnf -y install https://rpms.remirepo.net/enterprise/remi-release-8.rpm"
	action :run
end

execute "Install depedences" do
	command "dnf --enablerepo=PowerTools install -y doxygen yajl-devel"
	action :run
end

execute "Install depedences" do
	command "dnf --enablerepo=remi install -y GeoIP-devel"
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


#- name: clone the owasp-modsecurity-crs repository
#git:
#  repo: "https://github.com/SpiderLabs/owasp-modsecurity-crs.git"
#  accept_hostkey: yes
#  depth: 1
#  force: yes
#  dest: /usr/local/nginx/conf/owasp-crs
#
#- name: download and extract the nginx sources for building the module
#unarchive: 
#  src: "http://nginx.org/download/nginx-{{ installed_nginx_version }}.tar.gz"
#  dest: /opt
#  creates: "/opt/nginx-{{ installed_nginx_version }}"
#  remote_src: yes
#
#- name: Build install nginx
#shell: "{{ item }}"
#args:
#  chdir: "/opt/nginx-{{ installed_nginx_version }}"
#with_items:
#  - ./configure --user=nginx --group=nginx --with-pcre-jit --with-debug --with-http_ssl_module --with-http_v2_module --with-http_realip_module --add-module=/opt/modsec/ModSecurity-nginx
#  - make
#  - make install
#when: builder