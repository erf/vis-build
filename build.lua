function on_win_open(win)

	function error()
		vis:info('This filetype is not supported')
	end
	
	function build_c(f, o)
		vis:command(string.format('!gcc %s -o %s', f, o))
	end
	
	function build_swift(f, o)
		vis:command(string.format('!swiftc %s -o %s', f, o))
	end
	
	function build_rust(f, o)
		vis:command(string.format('!rustc %s -o %s', f, o))
	end
	
	function build_crystal(f, o)
		vis:command(string.format('!crystal build %s -o %s', f, o))
	end
	
	function build_haskell(f, o)
		vis:command(string.format('!ghc %s -o %s', f, o))
	end
	
	local lang = {}
	lang['.c']     = build_c
	lang['.swift'] = build_swift
	lang['.rs']    = build_rust
	lang['.cr']    = build_crystal
	lang['.hs']    = build_haskell

	function build()
		local f = win.file.name
		if f == nil then error() return end
		local i = string.find(f, '%.')
		if i == nil then error() return end
		local ext = string.sub(f, i)
		local method = lang[ext]
		if method == nil then error() return end
		local out = string.sub(f, 0, i - 1)
		vis:info(string.format('building \'%s\'', out))
		method(f, out)
	end
	
	vis:map(vis.modes.NORMAL, '<C-b>', build)
	vis:command_register('build', build)
end

vis.events.subscribe(vis.events.WIN_OPEN, on_win_open)

