namespace :data_scraper do
  desc "University Name and Tuition Fees from "
  task scrape: :environment do
    require 'open-uri'
	require 'nokogiri'

    url= "http://colleges.usnews.rankingsandreviews.com/best-colleges/rankings/national-universities/data"
	result = Nokogiri::HTML(open(url))

	page_numbers= []
	result.css('a.pager_link').each do |line|
		page_numbers << line.text
	end

	max_page= page_numbers[page_numbers.length-2]
	max_page.to_i.times do |i|
		if i==1
			result = Nokogiri::HTML(open(url))
		else
			url= "#{url}/page+#{i+1}"
			result = Nokogiri::HTML(open(url))
			
			#end
		end
		@name= []
		result.css('a.school-name').each do |line|
		  @name << line.text.squish
		end

		@fees= []
		result.css('td.search_tuition_display').each do |line|
		  @fees << line.text.squish
		end
	end
	
	puts @name
	puts @fees



	# name.length.times do |i|
	# 	@uni= University.new
	# 	@uni.name = name[i]
	# 	@uni.tuition_fees = fees[i]
	# 	@uni.save
	# end
  end

end
