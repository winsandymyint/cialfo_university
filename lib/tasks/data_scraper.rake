namespace :data_scraper do
  desc "University Name and Tuition Fees from "
  task scrape: :environment do
    require 'open-uri'
	require 'nokogiri'

    url= "http://colleges.usnews.rankingsandreviews.com/best-colleges/rankings/national-universities/data"
	#Parse the page with Nokogiri
	result = Nokogiri::HTML(open(url))

	#Scrape the max number of pages and store in max_page variable
	page_numbers= []
	result.css('a.pager_link').each do |line|
		page_numbers << line.text
	end

	#Initialize the empty array
	name= []
	fees= []

	#Loop once for every page for search result
	max_page= page_numbers[page_numbers.length-2]
	max_page.to_i.times do |i|
		#open search result page
		url= "http://colleges.usnews.rankingsandreviews.com/best-colleges/rankings/national-universities/data/page+#{i+1}"
		result = Nokogiri::HTML(open(url))

		#Store Data in array
		result.css('a.school-name').each do |line|
		  name << line.text.squish
		end
		result.css('td.search_tuition_display').each do |line|
		  fees << line.text.squish
		end

	end
	puts name.length

	name.length.times do |i|
		@uni= University.new
		@uni.name = name[i]
		@uni.tuition_fees = fees[i]
		@uni.save
	end
  end

end
