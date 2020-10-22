%w{ pcre-devel git lmdb lmdb-devel libxml2 libxml2-devel ssdeep ssdeep-devel lua lua-devel pcre-devel gcc-c++ flex bison yajl yajl-devel curl-devel curl GeoIP-devel doxygen zlib-deve  }.each do |pkg|
	package pkg do
	  action :install
	  retries 3
	  retry_delay 5
	end
end
 