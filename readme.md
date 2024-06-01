G Suit DCS Plugin

This is part of the DCS G Suit project (https://manueldobusch.eu/blog/index.php/2024/05/25/dcs-g-suite/)

https://github.com/wrongway88/gSuitServer

https://github.com/wrongway88/gSuitArduino

Install by copying the GSuit.lua file to the DCS script folder (e.g. C:/Users/<Username>/Saved Games/DCS.openbeta/Scripts/) and adding the following line to Export.lua

local dcsGs=require('lfs');dofile(dcsGs.writedir()..[[Scripts\GSuit.lua]])
