-- Add this line to Scripts/Export.lua:
-- local dcsGs=require('lfs');dofile(dcsGs.writedir()..[[Scripts\GSuit.lua]])

function LuaExportStart()
	socket = require("socket")
	
	host = "127.0.0.1"
	port = 56182
	
	lastTime = os.clock()
end

function LuaExportAfterNextFrame()
	delta = os.clock() - lastTime
	
	if delta >= 0.25 then
		connection = socket.try(socket.connect(host, port))
		connection:setoption("tcp-nodelay",true)
	
		socket.try(connection:send(string.format("%.3f<EOF>",LoGetAccelerationUnits().y)))
		
		lastTime = os.clock()
	end
end

function LuaExportStop()
	connection = socket.try(socket.connect(host, port))
	connection:setoption("tcp-nodelay",true)
	
	socket.try(connection:send("0.0<EOF>"))

	connection:close()
end
