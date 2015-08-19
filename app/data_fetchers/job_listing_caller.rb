class JobListingCaller

	def initialize
		@url = "https://api.usa.gov/jobs/search.json?"
	end

	def json_parse(job, place)
		JSON.parse(open("#{@url}query=#{job}+jobs+in+#{place}").read)
	end

end