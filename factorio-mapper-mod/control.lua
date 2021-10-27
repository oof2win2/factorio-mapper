local function screenshot (opts)
	local tiles = {}
	local entities = {}
	local tileColors = {}
	local entityColors = {}
	local surface = opts and opts.player_index and game.get_player(opts.player_index).surface or game.get_surface(1)
	local n = 0
	for chunk in surface.get_chunks() do
		n = n + 1
		if surface.is_chunk_generated({chunk.x, chunk.y}) then
			local chunkBoundingBox={left_top=chunk.area.left_top, right_bottom=chunk.area.right_bottom}
			log(serpent.line(chunkBoundingBox))
			local prof = game.create_profiler(false)
			local foundEntities = surface.find_entities(chunkBoundingBox)
			local foundTiles = surface.find_tiles_filtered{
				area=chunkBoundingBox
			}
			log(prof)


			prof.reset()
			-- for _, entity in pairs(foundEntities) do
			-- 	table.insert(entities, {
			-- 		x=entity.position.x+0.5, y=entity.position.y+0.5,
			-- 		color=entity.prototype and entity.prototype.map_color or "none"
			-- 	})
			-- end

			-- local i = 0
			for i, tile in pairs(foundTiles) do
				if tile.position.x % 4 == 0 and tile.position.y % 4 == 0 then
					-- local tileColor = tileColors[tile.name]
					-- if tileColor == nil then 
					-- 	tileColor = tile.prototype.map_color or "none"
					-- 	tileColors[tile.name] = tileColor
					-- end
					foundTiles[i] = {
						pos=tile.position,
						color=tile.prototype.map_color
					}
					-- i = i+1
				end
			end
			log(prof)
		end
	end
	log(tostring(n) .. " chunks have been found")
	-- return rcon.print(game.table_to_json(output))
	game.write_file("headless-screenshot.out", game.table_to_json({
		tiles=tiles,
		entities=entities,
	}), false)
end

commands.add_command("headless-screenshot", nil, screenshot)

-- local interface = {
-- 	["item-tile-list"] = screenshot
-- }