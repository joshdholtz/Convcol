module Boulder

	module Command

		class Install

			def self.run(argv, options)
				
				filename = "Boulder"
				filepath = "#{Dir.pwd}/#{filename}"

				exists = File.exist?(filepath)
				if !exists
					
				else

					boulder_file = Boulder::BoulderFile.new
					boulder_file.instance_eval( File.read(filepath), filepath )

					puts "Platform - #{boulder_file.platform.to_s}"
					puts "Version - #{boulder_file.version.to_s}"
					boulder_file.dependencies.each { |d| puts "Dependency - #{d.to_s}" }

				end

			end

		end

	end

end