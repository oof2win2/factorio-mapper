local function screenshot (opts)
	local output = {}
	local surface = opts and opts.player_index and game.get_player(opts.player_index).surface or game.get_surface(1)
	for chunk in surface.get_chunks() do
		if surface.is_chunk_generated({chunk.x, chunk.y}) then
			for y = chunk.area.left_top.y, chunk.area.right_bottom.y do
				for x = chunk.area.left_top.x, chunk.area.right_bottom.x do
					local tile = surface.get_tile(x, y)
					local entity = surface.find_entities({left_top={x+0.5, y+0.5}, right_bottom={x+0.5, y+0.5}})[1]
					table.insert(output, {
						x=x+0.5, y=y+0.5,
						-- tilename=tile and tile.name or "none",
						tilecolor=tile and tile.prototype and tile.prototype.map_color or "none",
						-- entityname=entity and entity.name or "none"
						entitycolor=entity  and entity.prototype and entity.prototype.map_color or "none"
					})
				end
			end
		end
	end
	-- return rcon.print(game.table_to_json(output))
	game.write_file("headless-screenshot.out", game.table_to_json(output), false)
end

commands.add_command("headless-screenshot", nil, screenshot)

-- local interface = {
-- 	["item-tile-list"] = screenshot
-- }