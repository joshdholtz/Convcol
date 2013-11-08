module Boulder

	class BoulderFile

		attr_accessor :platform, :version, :dependencies

		def initialize
			@dependencies = Array.new
		end

		def platform(platform=nil, version=nil)
			return @platform if platform == nil

			@platform = platform
			@version = version
		end

		def boulder(dependency=nil, version=nil)
			unless dependency.nil?
				@dependencies.push BoulderDependencies.new(dependency, version)
			end
		end

	end

	class BoulderDependencies < Hash

		def initialize(dependency, version=nil)
			super()

			if dependency.is_a?(Hash)
				merge! dependency
			elsif dependency.is_a?(String)
				self['boulder'] = dependency
				self['version'] = version
			end
		end

	end


end