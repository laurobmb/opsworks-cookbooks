bash 'run script' do
	user "root"
    cwd "/"
    code <<-EOH
        VERSAO="1.19.0"
        cd /opt/
        wget http://nginx.org/download/nginx-$VERSAO.tar.gz
        tar xzf nginx-$VERSAO.tar.gz

        cd /opt/nginx-$VERSAO
        ./configure --user=nginx --group=nginx --with-pcre-jit --with-debug --with-http_ssl_module --with-http_v2_module --with-http_realip_module --add-module=/opt/modsec/ModSecurity-nginx
        make
        make install

        ln -s /usr/local/nginx/sbin/nginx /usr/sbin/
    EOH
end


