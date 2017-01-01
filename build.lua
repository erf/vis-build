function on_win_open(win)

	function build()
		local f = win.file.name
		local o = string.sub(f, 0, string.find(f, '%.') - 1)
		vis:info(string.format('building %s', o))
		vis:command(string.format('!gcc %s -o %s', f, o))
	end
	
	vis:map(vis.modes.NORMAL, '<C-b>', build)
	vis:command_register('build', build)
end

vis.events.subscribe(vis.events.WIN_OPEN, on_win_open)

