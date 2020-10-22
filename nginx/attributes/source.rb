default['nginx']['version'] = "1.19.0"
default['nginx']['package_name'] = "nginx"
default['nginx']['dir'] = "/etc/nginx"
default['nginx']['log_dir'] = "/var/log/nginx"
default['nginx']['binary'] = "/usr/sbin/nginx"

case node['platform']
    when "debian","ubuntu"
        default['nginx']['user']       = "www-data"
        default['nginx']['init_style'] = "runit"
    when "redhat","centos","scientific","amazon","oracle","fedora"
        default['nginx']['user']       = "nginx"
        default['nginx']['init_style'] = "init"
        default['nginx']['repo_source'] = "epel"
    when "gentoo"
        default['nginx']['user']       = "nginx"
        default['nginx']['init_style'] = "init"
    else
        default['nginx']['user']       = "www-data"
        default['nginx']['init_style'] = "init"
end


