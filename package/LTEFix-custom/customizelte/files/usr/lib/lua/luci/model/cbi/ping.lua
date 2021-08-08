local utl = require "luci.util"

local sys   = require "luci.sys"
local zones = require "luci.sys.zoneinfo"
local fs    = require "nixio.fs"
local conf  = require "luci.config"

m = Map("ping", translate("LteFix Ping Test"), translate("Enable/Disable LteFix Special Ping Test"))

d = m:section(TypedSection, "ping", " ")
d.anonymous = true

c1 = d:option(ListValue, "enable", "Ping Test Status : ", "Ping every 10 minutes and, if it fails, restart modem if Comm port exists, reboot router otherwise");
c1:value("0", "Disabled")
c1:value("1", "Enabled")
c1.default=0

return m