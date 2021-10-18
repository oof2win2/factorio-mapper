import Renderer from "./Renderer.js"
import canvas from 'canvas';
const { createCanvas } = canvas;
import { Position } from "../types.js"

interface Tile {
	map_color?: string
	position: {
		x: number,
		y: number
	}
}

export default class TileRenderer extends Renderer {
	public tiles: Position[]
	public width: number
	public height: number

	constructor(data: Position[], width: number, height: number) {
		super()
		this.tiles = data
		this.width = width
		this.height = height
	}

	render() {
		const canvas = createCanvas(this.width, this.height)
		const ctx = canvas.getContext('2d')
		this.tiles.forEach((tile) => {
			if (tile.tilecolor !== "none") {
				ctx.rect(tile.x, tile.y, 2, 2)
				ctx.fillStyle = this.rgbaToHex(tile.tilecolor)
				ctx.fill()
			}
		})
		return canvas.createPNGStream()
	}
}