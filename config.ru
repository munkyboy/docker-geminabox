gem "geminabox"
require "geminabox"

Geminabox.data = "/var/lib/geminabox"
run Geminabox::Server
