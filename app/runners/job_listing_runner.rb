class	JobListingRunner

	def initialize
		system("clear")
		puts "Welcome to the (USAjobs.gov) job search"
		keys
	end

	def jobs_array
		@array = JobListingCaller.new.json_parse(@job_type, @state)
	end

	def test_keys(input)
		if input == "help"
			keys
			return true
		elsif input == "exit"
			abort("Goodbye!")
		end
	end

	def get_info
		puts "Please enter a job type:"
		@job_type = gets.chomp.downcase
		return true if test_keys(@job_type)

		puts "Enter a state(please abbreviate:\"NY\"):"
		@state = gets.chomp.downcase
		return true if test_keys(@state)
		false
	end

	def keys
		puts
		puts "*Type 'exit' if you want to leave."
    puts "*Type 'help' to view this menu again."
    puts
	end

	def search
		@array.each_with_index do |job, index|
			puts 
			puts "#{index + 1}."
			puts "Organization name: #{job["organization_name"]}"
			puts "Title: #{job["position_title"]}" 
			puts "Locations: #{@state}"
			puts "Open Period: #{job["start_date"]} - #{job["end_date"]}"
			puts "Salary Range: $#{job["minimum"]} - $#{job["maximum"]}"
			puts "More info: #{job["url"]}"
			puts
			break if index == 4
		end
	end

	def no_return
		if @array[0].nil?
			puts
			puts "There are no #{@job_type} jobs avaliable for state of #{@state} in the government database."
			puts "Please try again!"
			puts
			run
		end
	end

	def run
		while get_info == true
				get_info
		end
		jobs_array
		search
		no_return
	end
end
