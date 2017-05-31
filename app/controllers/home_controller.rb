require 'open-uri'
require 'nokogiri'
require 'rest-client'

class HomeController < ApplicationController
  
  def index
    @getBycreate = Post.all
    
    
  end
  
  def create
    ## 리셋하기
    Post.destroy_all
    ## 모델 설정
    model_total = Post.new
    ####### 영화 ######
    mov_uri = 'http://movie.naver.com/movie/running/current.nhn?view=list&tab=normal&order=reserve'
    mov     =  Nokogiri::HTML(open(mov_uri, 'User-Agent' => 'ruby'))
    
    model_total.movie_title  = mov.css('dt.tit a')[0].text
    model_total.movie_rate  = mov.css('div.b_star span.num')[0].text()
    model_total.movie_grade = mov.css('span.num')[0].text
    model_total.movie_image = mov.css('div.thumb a').css('img')[0]['src']
    
    ################# 공연 ###############################
    perform_uri = 'https://m.search.naver.com/search.naver?query=%EA%B3%B5%EC%97%B0&where=m&sm=mtp_hty'
    perform     =  Nokogiri::HTML(open(perform_uri, 'User-Agent' => 'ruby'))
    
    model_total.perform_title = perform.css('dl.detail dt.subtit')[0].text
    model_total.perform_date  = perform.css('dl.detail dd.stnce')[0].text() + perform.css('dl.detail dd.stnce')[1].text()
    model_total.perform_place = perform.css('dl.detail dd.stnce')[2].text()
    model_total.perform_image = perform.css('div.pfmc_thumb').css('img')[0]['src']
    
    ################### 도서 #####################
    
    book_uri = 'http://mbook.interpark.com/part/shop/rank/daterank/bestsellerHourList'
    book     = Nokogiri::HTML(RestClient.get(book_uri))
    
    model_total.book_title  = book.css('div.multiTxtEllipsis')[0].text()
    model_total.book_writer = book.css('span.txtEllipsis')[0].text()
    model_total.book_image  = book.css('div.productThum').css('img')[0]['src']
    
    ################# 구글 실시간 검색어###################################
    google_uri = 'https://trends.google.co.kr/trends/?geo=KR'
    google     =  Nokogiri::HTML(open(google_uri, 'User-Agent' => 'ruby'))
    
    model_total.google_title = google.css('a span.ellipsis-maker-inner')[0].text
    model_total.google_count = google.css('span.hottrends-single-trend-info-line-number')[0].text()
    model_total.google_image = google.css('div.hottrends-single-trend-image-and-text-container').css('img')[0]['src']
    
    
    ## 멜론 실시간 1위#####################################################################################
    
    uri = 'http://www.melon.com/chart/index.htm'
    melon = Nokogiri::HTML(open(uri))
    
     
      model_total.melon_title = melon.css('#lst50 td:nth-child(4) div div div.ellipsis.rank01 span strong a')[0].text()
      model_total.melon_album = melon.css('#lst50 td:nth-child(4) div div div:nth-child(3) div.ellipsis.rank03 a')[0].text()
      model_total.melon_artist = melon.css('#lst50 td:nth-child(4) div div div:nth-child(3) div.ellipsis.rank02 a span')[0].text()
      model_total.melon_image = melon.css('#lst50 td:nth-child(3) div a').css('img')[0]['src'].chomp "/melon/resize/48/quality/80/optimize"
      
      
    
    
   
    #################################################################################################
    
    ###무신사 1위 #####
    uri = 'http://store.musinsa.com/app/'
    musinsa = Nokogiri::HTML(open(uri))
    
    
      model_total.musinsa_brand = musinsa.css('#ranking_goods > div:nth-child(1) > ul:nth-child(1) > li > div.ranking_item_intro > p.txt_tit_brand')[0].text()
      model_total.musinsa_name = musinsa.css('#ranking_goods > div:nth-child(1) > ul:nth-child(1) > li > div.ranking_item_intro > p:nth-child(2) > a').text()
      model_total.musinsa_rank = musinsa.css('#ranking_goods > div:nth-child(1) > ul:nth-child(1) > li > div.ranking_item_intro > p.box_price > span.fr').text()
      model_total.musinsa_img = musinsa.css('#ranking_goods > div:nth-child(1) > ul:nth-child(1) > li > div.ranking_item_img > a').css('img')[0]['src']
      model_total.musinsa_before_price = musinsa.css('#ranking_goods > div:nth-child(1) > ul:nth-child(1) > li > div.ranking_item_intro > p.box_price > span.txt_origin_price').text()
      model_total.musinsa_after_price = musinsa.css('#ranking_goods > div:nth-child(1) > ul:nth-child(1) > li > div.ranking_item_intro > p.box_price > span.txt_price').text()
      
    ###네이버 속보####
    uri = 'http://news.naver.com/main/ranking/popularDay.nhn?mid=etc&sid1=111'
    naver_news = Nokogiri::HTML(open(uri))
     model_total.navernews_img = naver_news.css('div.content div:nth-child(6) li.num1 > div > a').css('img')[0]['src']
     model_total.navernews_name = naver_news.css('div.content div:nth-child(6) > ol > li.num1 > dl > dt > a')[0].text()
     model_total.navernews_content =  naver_news.css('div.content div:nth-child(6) ol li.num1 dl dd')[0].text()
    
    ###네이버 대기환경 ####
    uri = 'http://weather.naver.com/air/airFcast.nhn' ##경기도 기준, 케이웨더
    naver_weather = Nokogiri::HTML(open(uri))
     model_total.naver_weather_stateimg = naver_weather.css('#snb_wrap > h1 > a:nth-child(1)').css('img')[0]['src']
     model_total.naver_weather_statebase = naver_weather.css('#WTR_AIR_HDAY_FCAST > table > tbody > tr > td:nth-child(1) > div > h5 > a')[0].text()
     model_total.naver_weather_stateone = naver_weather.css('#WTR_AIR_HDAY_FCAST > table > tbody > tr > td:nth-child(1) > div > ul > li:nth-child(1)')[0].text()
     model_total.naver_weather_statetwo = naver_weather.css('#WTR_AIR_HDAY_FCAST > table > tbody > tr > td:nth-child(1) > div > ul > li:nth-child(2)')[0].text()
     model_total.naver_weather_statethree = naver_weather.css('#WTR_AIR_HDAY_FCAST > table > tbody > tr > td:nth-child(1) > div > ul > li:nth-child(3)')[0].text()
     model_total.naver_weather_statefour = naver_weather.css('#WTR_AIR_HDAY_FCAST > table > tbody > tr > td:nth-child(1) > div > ul > li:nth-child(4)')[0].text()
     model_total.naver_weather_statefive = naver_weather.css('#WTR_AIR_HDAY_FCAST > table > tbody > tr > td:nth-child(1) > div > ul > li:nth-child(5)')[0].text()
      
    
    #### U-20 한국#####
    
    uri = 'https://m.search.naver.com/search.naver?query=u-20&where=m&sm=mtp_hty'
    twenty = Nokogiri::HTML(open(uri, 'User-Agent' => 'ruby'))
      model_total.twenty_day = twenty.css('#ct > section.sc.cs_u20_worldcup._base_u20_worldcup > div:nth-child(1) > div.banner_section > div > div > span.day2')[0].text()
      model_total.twenty_odd = twenty.css('#ct > section.sc.cs_u20_worldcup._base_u20_worldcup > div:nth-child(1) > div.banner_section > div > div > span.gnb_text')[0].text()
      
      
    
    
    
    ## 모델 저장
    model_total.save
    redirect_to '/index'  
    
  end
  
  
end
