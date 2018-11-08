ActiveRecord::Base.connection_pool.with_connection do

require 'rubygems'
require 'nokogiri'
require 'open-uri'

class StartScrap

	attr_accessor :my_hash

		def initialize
			@url = Nokogiri::HTML(open('https://coinmarketcap.com/all/views/all/'))
			@my_hash = Hash.new	
		end

		def perform
			currency_array = []
			price_array = []
			@url.css("td.no-wrap.currency-name > a").each do |currency_name|        

			   	currency_array << currency_name.text
		    end

		    @url.css("a.price").each do |currency_price|

			   	price_array << currency_price.text
		    end
		    @my_hash = currency_array.zip(price_array).to_h
		end

		def save
			@my_hash.each_pair {|k, v| Crypto.create(currency: k, price: v)}
		end
	end
end