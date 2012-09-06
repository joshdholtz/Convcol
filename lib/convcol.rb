module Convcol

	class RGB

		def self.to_hex(red,green=nil,blue=nil)
			r = nil
			g = nil
			b = nil

			if green != nil and blue != nil
				r = red
				g = green
				b = blue
			elsif red.kind_of?(String)
				rgb = red.split(",")
				r = rgb[0]
				g = rgb[1]
				b = rgb[2]
			elsif red.kind_of?(Array)
				r = red[0]
				g = red[1]
				b = red[2]
			end

			return "##{r.to_i.to_s(16)}#{g.to_i.to_s(16)}#{b.to_i.to_s(16)}"
		end

	end

	class Hex

		def self.to_rgb(hex_str)
			hex_str_rev = hex_str.sub("#","").each_char.to_a.reverse.join
			if hex_str_rev.size == 3
				hex_str_rev = hex_str_rev[0] + hex_str_rev[0] + hex_str_rev[1] + hex_str_rev[1] + hex_str_rev[2] + hex_str_rev[2]
			elsif hex_str_rev.size != 6
				return nil
			end

			hex = hex_str_rev.to_s.hex
			rgb = {}
			%w(r g b).inject(hex) {|a,i| rest, rgb[i] = a.divmod 256; rest}
			red = rgb["r"].to_s
			green = rgb["g"].to_s
			blue = rgb["b"].to_s

			return "#{red},#{green},#{blue}"
		end

	end

end