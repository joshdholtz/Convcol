module Boulder

	module Command

		class Setup

			def self.run(argv, options)
				
				filename = "Boulder"

				exists = File.exist?("#{Dir.pwd}/#{filename}")
				if !exists
					File.open(filename, 'w') {|f| f.write("platform :android") }
				end

			end

		end

	end

end