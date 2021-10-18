import { PNGStream } from "canvas";
import { Color } from "../types";


export default class Renderer {
	render() {}
	/**
	 * 
	 * @param rgba {String} - accepts rgba string such as rgba(255, 255, 255, 255)
	 * @returns 
	 */
	protected rgbaToHex (rgba: Color) {
		function trim (str: string) {
			return str.replace(/^\s+|\s+$/gm,'');
		  }
		  
		let outParts = [
		  rgba.a.toString(16),
		  rgba.g.toString(16),
		  rgba.b.toString(16),
		  rgba.a.toString(16),
		];
	  
		// Pad single-digit output values
		outParts.forEach(function (part, i) {
		  if (part.length === 1) {
			outParts[i] = '0' + part;
		  }
		})
	  
		return ('#' + outParts.join(''));
	  }
	
}