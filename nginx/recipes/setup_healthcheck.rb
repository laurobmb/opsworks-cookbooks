
execute "Create nginx html dir" do
	command "sudo mkdir -p /etc/nginx/html"
	action :run
end

execute "Download cachestatus.html" do
	command "sudo wget https://s3.amazonaws.com/vtex-versioned-us/applications/janus/edge/cachestatus.html"
	cwd "/etc/nginx/html"
	action :run
end

