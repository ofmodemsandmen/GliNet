-- Licensed to the public under the Apache License 2.0.

module("luci.controller.ping", package.seeall)

function index()
	local page
	page = entry({"admin", "services", "ping"}, cbi("ping"), _("LteFix Ping Test"), 62)
	page.dependent = true
end
