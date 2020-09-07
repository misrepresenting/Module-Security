local function protect(id)
	local fakeid = 19218182-- you can put any fake id
	if not game then -- stops leakers from using third parties like repl.it
		require(fakeid) -- make them confused
		return
	end
	if rawequal(require, print) then -- stops leakers from using require = print in your scripts.
		require(fakeid)
		return
	end
	if game:GetService("RunService"):IsStudio() or game:GetService("RunService"):IsClient() then -- prevents leakers from running the script at all!
		require(fakeid)
		return
	end

	local s = pcall(function() -- prevents them from doing other stuff like require = function(...), also repl.it trick\
		require(1)
	end)
	if s then -- if they trigger the past check
		require(fakeid)
		return
	end
	if require ~= require then -- prevents enviroment dumpers
		require(fakeid)
		return 
	end
	-- once we do all of the checks require the module
	require(id) -- add the .stuff if your module has it
end
