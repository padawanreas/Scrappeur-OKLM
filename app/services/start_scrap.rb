require 'nokogiri'
require 'open-uri'

PAGE_URL ="https://coinmarketcap.com/"


class StartScrap

  def initialize
    @page = Nokogiri::HTML(open("https://coinmarketcap.com"))
  end

  def perform
    @crypto = @page.xpath('//*[contains(@class,"currency-name-container link-secondary")]').map{|item| item.text}
    @value= @page.xpath('//*[contains(@class,"no-wrap text-right")]').map{ |item| "$#{item["data-sort"]}"}
    @result=[]
      n=0
      while n < @crypto.length
          @result << {"Crypto" => @crypto[n],"Value" => @value[n] }
          n+=1
  end
end
  def save
    @result.each do |c|
    @crypto_db = CryptoDb.new
      @crypto_db.money = c["Crypto"]
      @crypto_db.value = c["Value"]
      @crypto_db.save
    end
  end
end
