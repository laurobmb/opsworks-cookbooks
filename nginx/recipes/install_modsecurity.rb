
execute "Create ModSecurity dir" do
	command "mkdir /opt/modsec/ModSecurity"
	action :run
end

execute "Download ModSecurity" do
	command "git clone https://github.com/SpiderLabs/ModSecurity.git"
	cwd "/opt/modsec/ModSecurity"
	action :run
end



#
#
#- name: clone the modsecurity repository
#git:
#  repo: "https://github.com/SpiderLabs/ModSecurity.git"
#  version: "{{ nginx_modsecurity_branch }}"
#  accept_hostkey: yes 
#  depth: 1 
#  force: yes
#  dest: /opt/modsec/ModSecurity
#
#- name: Build install modsecurity 
#shell: "{{ item }}"
#args:
#  chdir: /opt/modsec/ModSecurity
#with_items:
#- ./build.sh
#- git submodule init
#- git submodule update
#- ./configure
#- make
#- make install     
#when: builder
#
#- name: clone the modsecurity-nginx repository {{installed_nginx_version}}
#git:
#  repo: "https://github.com/SpiderLabs/ModSecurity-nginx.git"
#  version: "{{ nginx_modsecurity_nginx_branch }}"
#  accept_hostkey: yes
#  depth: 1
#  force: yes
#  dest: /opt/modsec/ModSecurity-nginx
#
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