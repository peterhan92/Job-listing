class	JobListingRunner

	BASE_URL = "https://api.usa.gov/jobs/search.json?"

	def initialize
		system("clear")
		puts "Welcome to the (USAjobs.gov) job search"
	end

	def search(job_type = "king", state = "neverland")
		puts "Please enter a job type:"
		job_type = gets.chomp.downcase
		puts "Enter a state(abbreviate:\"NY\"):"
		state = gets.chomp.upcase
		jobs_array = JSON.parse(open("#{BASE_URL}query=#{job_type}+jobs+in+#{state}").read)
		begin
			jobs_array.each_with_index do |job, index|
				puts 
				puts "#{index + 1}."
				puts "Organization name: #{job["organization_name"]}"
				puts "Title: #{job["position_title"]}" 
				puts "Locations: #{state}"
				puts "Open Period: #{job["start_date"]} - #{job["end_date"]}"
				puts "Salary Range: $#{job["minimum"]} - $#{job["maximum"]}"
				puts "More info: #{job["url"]}"
				puts
				break if index == 4
			end
		rescue 
			puts "There are no #{job_type} jobs avaliable for #{state} in the government database."
		end
	end
end

