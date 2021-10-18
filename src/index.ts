import fs from "fs"
import { Position } from "./types"
import TileRenderer from "./utils/TileRenderer.js"

const data: Position[] = JSON.parse(fs.readFileSync("./src/headless-screenshot.out", "utf-8"))

let widthMax = 0
let heightMax = 0
let widthMin = 0
let heightMin = 0
data.forEach(position => {
	if (position.x < widthMin) widthMin = position.x
	else if (position.x > widthMax) widthMax = position.x

	if (position.y < heightMin) heightMin = position.x
	else if (position.y > heightMax) heightMax = position.x
})

const tiles = new TileRenderer(data, 1024, 1024)
fs.writeFile("output.png", tiles.render(), () => {})