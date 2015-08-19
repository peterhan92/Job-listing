# class JobListingCaller

# 	attr_accessor :get_job, :get_state

# 	def initialize
# 		@url = "https://api.usa.gov/jobs/search.json?"
# 		puts "Welcome to the (USAjobs.gov) job search!"
# 	end

# 	def get_info
# 		puts "Please enter a job type:"
# 		get_job = gets.chomp.downcase
# 		puts "Enter a state(abbreviate:\"NY\"):"
# 		get_state = gets.chomp.upcase
# 	end

# 	def json_parse
# 		jobs_array = JSON.parse(open("#{@url}query=#{get_job}+jobs+in+#{get_state}").read)
# 	binding.pry
# 	end

# end