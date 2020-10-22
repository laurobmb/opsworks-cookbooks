packages = []

case node[:platform_family]
    when 'rhel','centos'
      packages = [
        "lmdb",
        "lmdb-devel",
        "libxml2",
        "libxml2-devel",
        "ssdeep",
        "ssdeep-devel",
        "lua",
        "lua-devel",
        "pcre-devel",
        "gcc-c++",
        "flex",
        "bison",
        "yajl",
        "yajl-devel",
        "curl-devel",
        "curl",
        "GeoIP-devel",
        "doxygen",
        "zlib-devel"
        ]
    end

default[:cookbookname][:packages] = packages
