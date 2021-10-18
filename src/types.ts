export interface Color {
	r: number
	g: number
	b: number
	a: number
}

export interface Position {
	x: number
	y: number
	tilecolor: "none" | Color
	entitycolor: "none" | Color
}
