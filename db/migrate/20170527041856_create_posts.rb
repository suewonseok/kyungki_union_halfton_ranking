class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      ############# 멜론 ################
      t.string :melon_title
      t.string :melon_album
      t.string :melon_artist
      t.string :melon_image
      
      ############# 영화  ################
      t.string :movie_title
      t.string :movie_grade
      t.string :movie_rate
      t.string :movie_image
      
      ############# 공연 ################
      
      t.string :perform_title
      t.string :perform_date
      t.string :perform_place
      t.string :perform_image
      
      ############### 책 ################
      t.string :book_title
      t.string :book_publisher
      t.string :book_writer
      t.string :book_image
      
      ################# 구글 실시간 검색어################################
      t.string :google_title
      t.string :google_count
      t.string :google_image
      
      ###############무신사###################
      t.string :musinsa_brand
      t.string :musinsa_name
      t.string :musinsa_rank
      t.string :musinsa_img
      t.string :musinsa_before_price
      t.string :musinsa_after_price
      
      ###############네이버 속보################
      t.string :navernews_name
      t.string :navernews_content
      t.string :navernews_img
      
      ################네이버 기상 상태##############
      t.string :naver_weather_statebase
      t.string :naver_weather_stateone
      t.string :naver_weather_statetwo
      t.string :naver_weather_statethree
      t.string :naver_weather_statefour
      t.string :naver_weather_statefive
      t.string :naver_weather_stateimg
      
      
      ################한국 U-20 ####################
      t.string :twenty_day
      t.string :twenty_odd
      
      
      t.timestamps null: false
    end
  end
end
