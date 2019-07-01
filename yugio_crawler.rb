#!/usr/bin/ruby
require 'selenium-webdriver'
require "rubygems"
require "active_record"
require 'open-uri'
require 'nokogiri'
require 'uri'
require 'logger'
require 'date'
#require 'mysql2'
#require 'csv'
require 'mysql2'
require "active_record"
require 'date'

puts 'start'
puts Time.new

# create database lancers_kpro;
# create table products (id int auto_increment, job_title varchar(255), url varchar(255), keyword varchar(255), index(id));

client = Mysql2::Client.new(:host => "localhost", :username => "root", :password => "", :database => "yugio_development")
# DB接続設定
ActiveRecord::Base.establish_connection(
    adapter:  "mysql2",
    host:     "localhost",
    username: "root",
    password: "",
    database: "yugio_development",
)

class Card < ActiveRecord::Base
end

class Attribute < ActiveRecord::Base
end

class Tribe < ActiveRecord::Base
end

class RecordCard < ActiveRecord::Base
end

class Record < ActiveRecord::Base
end

time = Time
date = Date.today
today = date.year.to_s + '-' + date.month.to_s + '-' + date.day.to_s

#Selenium::WebDriver::Chrome.driver_path = './chromedriver'
#Selenium::WebDriver::Chrome::Service.driver_path= '/opt/bitnami/ruby/bin/chromedriver'

#chromeを開く
options = Selenium::WebDriver::Chrome::Options.new
# options.add_argument('--headless')
driver = Selenium::WebDriver.for :chrome, options: options
#driver = Selenium::WebDriver.for(:chrome)
wait = Selenium::WebDriver::Wait.new(:timeout => 10000)


begin
  #スタート
  driver.manage.timeouts.implicit_wait = 0
  driver.get 'https://www.db.yugioh-card.com/yugiohdb/card_search.action'
  driver.find_element(:xpath, '//*[@id="search_by_keyword_and_type"]/table/tbody/tr/td[5]/a').click()

  finished = []

  [84].each do |x|
    begin
      begin
        driver.get "https://www.db.yugioh-card.com/yugiohdb/card_search.action?ope=1&sess=2&sort=1&rp=100&page=" + x.to_s
        puts "#{x}ページ目"

        begin
          2.upto(100) do |y|
            begin
              # 普通
              flag = 0

              # begin
              #   if driver.find_element(:xpath, '//*[@id="article_body"]/table/tbody/tr/td/div[3]/ul/li/dl/dt/span[2]/span/img')
              #     # 禁止
              #     flag = 1 if driver.find_element(:xpath, '//*[@id="article_body"]/table/tbody/tr/td/div[3]/ul/li/dl/dt/span[2]/span/img').attribute('alt') == '禁止'
              #     # 制限
              #     flag = 2 if driver.find_element(:xpath, '//*[@id="article_body"]/table/tbody/tr/td/div[3]/ul/li/dl/dt/span[2]/span/img').attribute('alt') == '制限'
              #     # 準制限
              #     flag = 3 if driver.find_element(:xpath, '//*[@id="article_body"]/table/tbody/tr/td/div[3]/ul/li/dl/dt/span[2]/span/img').attribute('alt') == '準制限'
              #   end
              # rescue => e
              #   # p e
              # end

              driver.find_element(:xpath, "//*[@id='article_body']/table/tbody/tr/td/div[3]/ul/li[#{y}]").click()
              puts "#{((x.to_i-1)*100.to_i+y.to_i).to_s}個目"
              window = driver.window_handles.last   # ウィンドウ情報を取得
              driver.switch_to.window(window)       # 遷移先のウィンドウに遷移元のウィンドウ情報を移す

              sleep 3

              name = ''
              e_name = ''
              name_kana = ''

              begin
                name_kana = driver.find_element(:xpath, '//*[@id="broad_title"]/div/h1/span').text if driver.find_element(:xpath, '//*[@id="broad_title"]/div/h1/span')
              rescue => e

              end

              begin
                name_kana = driver.find_element(:xpath, '//*[@id="broad_title"]/div/h1/span[1]').text if driver.find_element(:xpath, '//*[@id="broad_title"]/div/h1/span[1]')
              rescue => e
                # p e
              end

              begin
                e_name = driver.find_element(:xpath, '//*[@id="broad_title"]/div/h1/span[2]').text if driver.find_element(:xpath, '//*[@id="broad_title"]/div/h1/span[2]')
              rescue => e
                # p e
              end

              begin
                p driver.find_element(:xpath, '//*[@id="broad_title"]/div/h1').text.to_s
                p driver.find_element(:xpath, '//*[@id="broad_title"]/div/h1').text.to_s.gsub(/\r\n|\r|\n/, ',')
                      # .gsub(/#{e_name.to_s}$/, '').gsub(/\r\n|\r|\n/, "")
                name = driver.find_element(:xpath, '//*[@id="broad_title"]/div/h1').text.to_s.gsub(/\r\n|\r|\n/, ',') if driver.find_element(:xpath, '//*[@id="broad_title"]/div/h1')
              rescue => e
                # p e
              end

              image_original = driver.find_element(:xpath, '//*[@id="card_image_1"]').attribute('src')

              attribute = ''
              effect = ''
              link = ''
              rank = ''
              level = ''
              pendulum_scale = ''
              pendulum_effect = ''
              tribe = ''
              other = ''
              offensive_power = ''
              deffensive_power = ''
              text = ''

              1.upto(8) do |num|
                # 1-1
                begin
                  if driver.find_elements(:xpath, "//*[@id=" + '"' + "details" + '"' + "]/tbody/tr[#{num.to_s}]/td[1]/div/span[1]/b")
                    if driver.find_element(:xpath, "//*[@id=" + '"' + "details" + '"' + "]/tbody/tr[#{num.to_s}]/td[1]/div/span[1]/b").text == '属性'
                    attribute = driver.find_element(:xpath, "//*[@id=" + '"' + "details" + '"' + "]/tbody/tr[#{num.to_s}]/td[1]/div/span[2]").text
                    end
                  end
                rescue => e
                  # p e
                end

                # 1
                begin
                  if driver.find_elements(:xpath, "//*[@id=" + '"' + "details" + '"' + "]/tbody/tr[#{num.to_s}]/td/div/span/b")
                    if driver.find_element(:xpath, "//*[@id=" + '"' + "details" + '"' + "]/tbody/tr[#{num.to_s}]/td/div/span/b").text == '効果'
                      effect = driver.find_element(:xpath, "//*[@id=" + '"' + "details" + '"' + "]/tbody/tr[#{num.to_s}]/td/div").text.to_s
                    end
                  end
                rescue => e
                  # p e
                end

                # 1-2
                begin
                  if driver.find_elements(:xpath, "//*[@id=" + '"' + "details" + '"' + "]/tbody/tr[#{num.to_s}]/td[2]/div/span[1]/b")
                    if driver.find_element(:xpath, "//*[@id=" + '"' + "details" + '"' + "]/tbody/tr[#{num.to_s}]/td[2]/div/span[1]/b").text == 'リンク'
                      link = driver.find_element(:xpath, "//*[@id=" + '"' + "details" + '"' + "]/tbody/tr[#{num.to_s}]/td[2]/div/span[2]").text
                    end
                  end
                rescue => e
                  # p e
                end

                # 1-2
                begin
                  if driver.find_elements(:xpath, "//*[@id=" + '"' + "details" + '"' + "]/tbody/tr[#{num.to_s}]/td[2]/div/span[1]/b")
                    if driver.find_element(:xpath, "//*[@id=" + '"' + "details" + '"' + "]/tbody/tr[#{num.to_s}]/td[2]/div/span[1]/b").text == 'ランク'
                      rank = driver.find_element(:xpath, "//*[@id=" + '"' + "details" + '"' + "]/tbody/tr[#{num.to_s}]/td[2]/div/span[2]").text
                    end
                  end
                rescue => e
                  # p e
                end

                # 1-2
                begin
                  if driver.find_elements(:xpath, "//*[@id=" + '"' + "details" + '"' + "]/tbody/tr[#{num.to_s}]/td[2]/div/span[1]/b")
                    if driver.find_element(:xpath, "//*[@id=" + '"' + "details" + '"' + "]/tbody/tr[#{num.to_s}]/td[2]/div/span[1]/b").text == 'レベル'
                      level = driver.find_element(:xpath, "//*[@id=" + '"' + "details" + '"' + "]/tbody/tr[#{num.to_s}]/td[2]/div/span[2]").text
                    end
                  end
                rescue => e
                  # p e
                end

                # 2
                begin
                  if driver.find_elements(:xpath, "//*[@id=" + '"' + "details" + '"' + "]/tbody/tr[#{num.to_s}]/td/div/span/b")
                    if driver.find_element(:xpath, "//*[@id=" + '"' + "details" + '"' + "]/tbody/tr[#{num.to_s}]/td/div/span/b").text == 'ペンデュラムスケール'
                      pendulum_scale = driver.find_element(:xpath, "//*[@id=" + '"' + "details" + '"' + "]/tbody/tr[#{num.to_s}]/td/div").text.to_s
                    end
                  end
                rescue => e
                  # p e
                end

                # 3
                begin
                  if driver.find_elements(:xpath, "//*[@id=" + '"' + "details" + '"' + "]/tbody/tr[#{num.to_s}]/td/div/div/b")
                    if driver.find_element(:xpath, "//*[@id=" + '"' + "details" + '"' + "]/tbody/tr[#{num.to_s}]/td/div/div/b").text == 'ペンデュラム効果'
                      pendulum_effect = driver.find_element(:xpath, "//*[@id=" + '"' + "details" + '"' + "]/tbody/tr[#{num.to_s}]/td/div").text.to_s
                    end
                  end
                rescue => e
                  # p e
                end

                # 2
                begin
                  if driver.find_elements(:xpath, "//*[@id=" + '"' + "details" + '"' + "]/tbody/tr[#{num.to_s}]/td/div/span/b")
                    if driver.find_element(:xpath, "//*[@id=" + '"' + "details" + '"' + "]/tbody/tr[#{num.to_s}]/td/div/span/b").text == '種族'
                      tribe = driver.find_element(:xpath, "//*[@id=" + '"' + "details" + '"' + "]/tbody/tr[#{num.to_s}]/td/div").text.to_s
                    end
                  end
                rescue => e
                  # p e
                end

                # 3
                begin
                  if driver.find_elements(:xpath, "//*[@id=" + '"' + "details" + '"' + "]/tbody/tr[#{num.to_s}]/td/div/span/b")
                    if driver.find_element(:xpath, "//*[@id=" + '"' + "details" + '"' + "]/tbody/tr[#{num.to_s}]/td/div/span/b").text == 'その他項目'
                      other = driver.find_element(:xpath, "//*[@id=" + '"' + "details" + '"' + "]/tbody/tr[#{num.to_s}]/td/div").text.to_s
                    end
                  end
                rescue => e
                  # p e
                end

                # 4-1
                begin
                  if driver.find_elements(:xpath, "//*[@id=" + '"' + "details" + '"' + "]/tbody/tr[#{num.to_s}]/td[1]/div/span[1]/b")
                    if driver.find_element(:xpath, "//*[@id=" + '"' + "details" + '"' + "]/tbody/tr[#{num.to_s}]/td[1]/div/span[1]/b").text == '攻撃力'
                      offensive_power = driver.find_element(:xpath, "//*[@id=" + '"' + "details" + '"' + "]/tbody/tr[#{num.to_s}]/td[1]/div/span[2]").text
                    end
                  end
                rescue => e
                  # p e
                end

                # 4-2
                begin
                  if driver.find_elements(:xpath, "//*[@id=" + '"' + "details" + '"' + "]/tbody/tr[#{num.to_s}]/td[2]/div/span[1]/b")
                    if driver.find_element(:xpath, "//*[@id=" + '"' + "details" + '"' + "]/tbody/tr[#{num.to_s}]/td[2]/div/span[1]/b").text == '守備力'
                      deffensive_power = driver.find_element(:xpath, "//*[@id=" + '"' + "details" + '"' + "]/tbody/tr[#{num.to_s}]/td[2]/div/span[2]").text
                    end
                  end
                rescue => e
                  # p e
                end

                # 5
                begin
                  if driver.find_elements(:xpath, "//*[@id=" + '"' + "details" + '"' + "]/tbody/tr[#{num.to_s}]/td/div/div/b")
                    if driver.find_element(:xpath, "//*[@id=" + '"' + "details" + '"' + "]/tbody/tr[#{num.to_s}]/td/div/div/b").text == 'カードテキスト'
                      text = driver.find_element(:xpath, "//*[@id=" + '"' + "details" + '"' + "]/tbody/tr[#{num.to_s}]/td/div").text.to_s
                      begin
                        if driver.find_element(:xpath, "//*[@id=" + '"' + "details" + '"' + "]/tbody/tr[#{num.to_s}]/td/div/div[2]/span")
                          p driver.find_element(:xpath, "//*[@id=" + '"' + "details" + '"' + "]/tbody/tr[#{num.to_s}]/td/div/div[2]/span").text
                          flag = 1 if driver.find_element(:xpath, "//*[@id=" + '"' + "details" + '"' + "]/tbody/tr[#{num.to_s}]/td/div/div[2]/span").text == '禁止'
                          flag = 2 if driver.find_element(:xpath, "//*[@id=" + '"' + "details" + '"' + "]/tbody/tr[#{num.to_s}]/td/div/div[2]/span").text == '制限'
                          flag = 3 if driver.find_element(:xpath, "//*[@id=" + '"' + "details" + '"' + "]/tbody/tr[#{num.to_s}]/td/div/div[2]/span").text == '準制限'
                        end
                      rescue => e
                      end

                    end
                  end
                rescue => e
                  # p e
                end
              end

              original_url = driver.current_url

              series = []
              2.upto(20) do |z|
                begin
                  if driver.find_element(:xpath, "//*[@id='pack_list']/table/tbody/tr[#{z}]")
                    release_date = driver.find_element(:xpath, "//*[@id='pack_list']/table/tbody/tr[#{z}]/td[1]").text
                    number = driver.find_element(:xpath, "//*[@id='pack_list']/table/tbody/tr[#{z}]/td[2]").text
                    r_name = driver.find_element(:xpath, "//*[@id='pack_list']/table/tbody/tr[#{z}]/td[3]/b").text
                    specification = ''
                    begin
                      specification = driver.find_element(:xpath, "//*[@id='pack_list']/table/tbody/tr[#{z}]/td[4]/img").attribute('alt') if driver.find_element(:xpath, "//*[@id='pack_list']/table/tbody/tr[#{z}]/td[4]/img")
                    rescue => e
                    end
                    p release_date
                    p number
                    p r_name
                    p specification
                    core = {}
                    core.store("release_date", release_date)
                    core.store("number", number)
                    core.store("r_name", r_name)
                    core.store("specification", specification)
                    series.push(core)
                  else
                    p 'これ以上シリーズ見つかりません'
                    break
                  end
                rescue => e
                  p e
                  p 'これ以上シリーズ見つかりません'
                  break
                end
              end

              p 'シリーズ: ' + series.to_s

              p '名前かな: ' + name_kana
              p '名前: ' + name
              p '英名: ' + e_name
              p '属性: ' + attribute
              p '効果: ' + effect
              p 'リンク: ' + link
              p 'ランク: ' + rank
              p 'レベル: ' + level
              p 'ペンデュラムスケール: ' + pendulum_scale
              p 'ペンデュラム効果: ' + pendulum_effect
              p '種族: ' + tribe
              p 'その他項目: ' + other
              p '攻撃力: ' + offensive_power
              p '守備力: ' + deffensive_power
              p 'カード説明: ' + text
              p 'フラグ: ' + flag.to_s
              p '元画像: ' + image_original
              p 'URL: ' + original_url

              innerhtml = ''
              begin
                innerhtml = driver.find_element(:xpath, '//*[@id="details"]').attribute("innerHTML")
              rescue => e
                # p e
              end
              # p innerhtml

              card = Card.create!(
                      name: name,
                      name_kana: name_kana,
                      e_name: e_name,
                      attribute_id: attribute.blank? ? nil : Attribute.find_by(name: attribute.to_s.gsub('属性', '')).id,
                      tribe_id: tribe.blank? ? nil : Tribe.find_by(name: tribe.to_s.gsub('種族', '').gsub(/\r\n|\r|\n/, "")).id,
                      effect: effect.blank? ? nil : effect,
                      link: link.blank? ? nil : link.to_i,
                      rank: rank.blank? ? nil : rank.to_i,
                      level: level.blank? ? nil : level.to_i,
                      pendulum_scale: pendulum_scale.blank? ? nil : pendulum_scale.to_s.gsub('ペンデュラムスケール', '').to_i,
                      pendulum_effect: pendulum_effect.blank? ? nil : pendulum_effect.to_s.gsub('ペンデュラム効果', ''),
                      offensive_power: offensive_power.to_s == '-' ? nil : offensive_power.to_i,
                      deffensive_power: deffensive_power.to_s == '-' ? nil : deffensive_power.to_i,
                      other: other.blank? ? nil : other.to_s.gsub('その他項目', '').gsub(/\r\n|\r|\n/, ""),
                      text: text.to_s.gsub('カードテキスト', '').gsub(/\r\n|\r|\n/, ""),
                      image_original: image_original,
                      flag: flag,
                      original_url: original_url,
                      innerhtml: innerhtml,

              )

              series.each do |g|
                p g
                p Date.strptime(g['release_date'],'%Y-%m-%d')
                record = Record.create(
                  release_date: Date.strptime(g['release_date'],'%Y-%m-%d'),
                  number: g['number'],
                  name: g['r_name'],
                  specification: g['specification'],
                )

                RecordCard.create(
                  card_id: card.id,
                  record_id: record.id,
                )
              end

              finished.push(((x.to_i-1)*100.to_i+y.to_i).to_s)
              p finished


              driver.close                          # 遷移元のウィンドウを閉じる。特に必要なければ記述の必要なし
              window = driver.window_handles.first   # ウィンドウ情報を取得
              driver.switch_to.window(window)       # 遷移先のウィンドウに遷移元のウィンドウ情報を移す

            rescue => e
              p e
            end
          end

        rescue => e
          p e
        end

      rescue => e
        p e
      end
    rescue => e
      p e
    end
  end




  # # driver.manage.window.maximize
  # #sleep(10)
  # #p driver.page_source
  #
  #
  # #ログイン
  # #wait.until {driver.find_element(:class, 'nav-btn-login').displayed?}
  # puts 'ログイン画面'
  # #driver.get driver.find_element(:class, 'nav-btn-login').find_element(:tag_name,'a').attribute('href') # ログインするボタンクリック
  # #wait.until {driver.find_element(:xpath, '//*[@id="UserEmail"]').displayed?}
  # driver.find_element(:xpath, "//*[@id="UserEmail"]').send_keys "kpro.members@gmail.com"
  # driver.find_element(:xpath, '//*[@id="UserPassword"]').send_keys "oiekorp2019"
  # driver.find_element(:xpath, '//*[@id="form_submit"]').click() # ログインするボタンクリック
  # puts 'ログインしました'
  #
  #
  # categories = {
  #   'https://www.lancers.jp/work/search/system?open=1&category=0&page=':'system',#システム開発・運用
  #   'https://www.lancers.jp/work/search/web?ref=header_menu&category=0&page=':'web', #Web制作・Webデザイン
  #   #'https://www.lancers.jp/work/search/design?ref=header_menu&category=0&page=':'design', #デザイン制作
  #   #'https://www.lancers.jp/work/search/writing?ref=header_menu&category=0&page=':'writing', #ライティング・ネーミング
  #   #'https://www.lancers.jp/work/search/task?ref=header_menu&category=0&page=':'task', #タスク・作業
  #   # 'https://www.lancers.jp/work/search/translation?ref=header_menu&category=0&page=', #翻訳・通訳サービス
  #   # 'https://www.lancers.jp/work/search/multimedia?ref=header_menu&category=0&page=', #マルチメディア
  #   # 'https://www.lancers.jp/work/search/business?ref=header_menu&category=0&page=', #ビジネス・事務・専門・その他
  # }
  #
  # categories.each do |c_url,keyword|
  #   puts keyword + '関連の仕事を探します'
  #   page_number = rand(20)
  #   puts page_number
  #   total_tasks = 0
  #   todays_list = []
  #   repeat_check = true
  #   # repeat_list = []
  #   #repeat_list = File.open('repeat/repeat_' + keyword +'.txt').readlines{|m| m.to_s.chomp}
  #   # File.open('repeat/repeat_' + keyword +'.txt') do |file|
  #   #   repeat_list = file.readlines#.split("\n")
  #   # end
  #
  #   # @repeat_list = Product.all
  #   # File.open('repeat/repeat_' + keyword +'.txt'){|f|
  #   #   f.each_line{|line|
  #   #     repeat_list.push(line.to_s.chomp) #改行なしで、配列に保存
  #   #   }
  #   # }
  #   #print repeat_list
  #
  #
  #   begin
  #     #pageを回していく
  #     while repeat_check do
  #       page_url = c_url.to_s + page_number.to_s
  #       puts page_url
	# sleep(5)
  #       driver.get page_url
  #
  #       # tasks.each do |task|は、tasksのインスタンスIDが毎回変わってしまうのでできない
  #       wait.until {driver.find_element(:class, 'c-media-list__item').displayed?}
  #       tasks = driver.find_elements(:class, 'c-media-list__item')
  #       puts 'このページには' + tasks.size.to_s + '件の仕事があります'
  #
  #       for n in 0..tasks.size-1 do
  #         puts (total_tasks + (n + 1)).to_s + "件目の仕事です"
  #         tasks = driver.find_elements(:class, 'c-media-list__item')
  #         task = tasks[n]
  #
  #         flag = false
  #         begin
  #           if task.find_element(:tag_name, 'div').find_element(:class, 'c-media__content__left').find_element(:tag_name, 'div') \
  #                  .find_element(:class, 'c-media__job-time__ttl').text == '募集中' then
  #             flag = true
  #           elsif task.find_element(:tag_name, 'div').find_element(:class, 'c-media__content__right').find_element(:tag_name, 'a') \
  #                  .find_element(:tag_name, 'span').find_element(:tag_name, 'ul').find_element(:class, 'c-media__job-tag--limited').text.include?("限定公開") then
  #             flag = true
  #           end
  #         rescue
  #           puts 'flagがfalse'
  #         end
  #
  #         if flag then
  #           puts '募集中でした'
  #           url = task.find_element(:tag_name, 'div').find_element(:class, 'c-media__content__right').find_element(:tag_name, 'a').attribute('href')
  #           driver.get url
  #
  #           #lancersのページ内にあるか
  #           if driver.find_elements(:class, 'ljp-header__logo__img').size == 1 then
  #             if driver.find_elements(:class, 'show_popup_button').size == 1 && driver.find_element(:class, 'show_popup_button').find_element(:tag_name, 'a').text.include?('提案する') then
  #               begin
  #                 #print driver.find_element(:class, 'show_popup_button').find_element(:tag_name, 'a').text
  #                 driver.find_element(:class, 'show_popup_button').click() #propose
  #
  #                 wait.until {driver.find_element(:class, 'registration').displayed?}
  #                 #job = driver.find_element(:class, 'registration').text.match(/「(.+)」/)
  #                 #job_title = job[1]
  #                 job_title = driver.find_element(:class, 'registration').text.match(/「(.+)」/)[1].chomp
  #                 puts job_title
  #
  #                 #今までのJobと被っているか
  #                 if Product.all.where(job_title: job_title).blank?
  #                   @product = Product.create!(job_title: job_title, url: url, keyword: keyword)
  #                 else
  #                   puts 'job被り'
  #                   #repeat_check = false
  #                   next
  #                 end
  #
  #                 # if repeat_list.include?(job_title) then
  #                 #   puts 'job被り'
  #                 #   repeat_check = false
  #                 #   break
  #                 # else
  #                 #   todays_list << job_title #新たな仕事はメモする
  #                 # end
  #
  #                 #designだけここの申込み事項が異なるため、除外してある
  #                 #wait.until {driver.find_element(:class, 'workprice__text--high').find_element(:class, 'price-number').displayed?}
  #                 max_price = driver.find_element(:class, 'workprice__text--high').find_element(:class, 'price-number').text
  #                 max_price = max_price.gsub(/,/ , '') #3桁ごとの区切りを取る
  #                 max_80per_price = ( max_price.to_i * 3 / 2 ).to_s #maxの15割を申請する
  #                 puts max_80per_price
  #                 due_date =driver.find_element(:xpath, '//*[@id="form_center"]/table/tbody/tr[5]/td').text
  #                 #wait.until {driver.find_element(:xpath, '//*[@id="ProposalTemplate"]').displayed?}
  #                 driver.find_element(:xpath, '//*[@id="ProposalTemplate"]').click()
  #                 if keyword == 'system' then
  #                   driver.find_element(:xpath, '//*[@id="ProposalTemplate"]/option[2]').click()
  #                 elsif keyword == 'web' then
  #                   driver.find_element(:xpath, '//*[@id="ProposalTemplate"]/option[2]').click()
  #                 else
  #                   driver.find_element(:xpath, '//*[@id="ProposalTemplate"]/option[2]').click()
  #                 # elsif keyword == 'design' then
  #                 #   driver.find_element(:xpath, '//*[@id="ProposalTemplate"]/option[4]').click()
  #                 # elsif keyword == 'writing' then
  #                 #   driver.find_element(:xpath, '//*[@id="ProposalTemplate"]/option[3]').click()
  #                 # elsif keyword == 'task' then
  #                 #   driver.find_element(:xpath, '//*[@id="ProposalTemplate"]/option[2]').click()
  #                 end
  #
  #                 driver.find_element(:xpath, '//*[@id="dateinput10"]').send_keys due_date
  #                 driver.find_element(:xpath, '//*[@id="Milestone10Amount"]').send_keys max_80per_price
  #                 driver.find_element(:xpath, '//*[@id="form_end"]').click()
  #
  #                 #これで作業が完了する
  #                 wait.until {driver.find_element(:xpath, '//*[@id="form_end"]').displayed?}
  #                 driver.find_element(:xpath, '//*[@id="form_end"]').click() #final click
  #
  #                 sleep 1
  #                 puts '提案終わりました'
  #               rescue => e
  #                 puts 'error'
  #                 p e.message
  #               end
  #
  #             else  #応募資格なし(本人確認)や、提案できませんの場合
  #               puts '提案しませんでした'
  #             end
  #
  #           else #prosheetに飛んだ場合
  #             puts 'prosheetに飛びました'
	#       next
  #             begin
  #
  #               wait.until {driver.find_element(:xpath, '/html/body/main/div[4]/div/div/div/div/div/div[1]/p[3]/button').displayed?}
  #               driver.find_element(:xpath, '/html/body/main/div[4]/div/div/div/div/div/div[1]/p[3]/button').click() #propose
  #               wait.until {driver.find_element(:xpath, '//*[@id="js__setPref"]/div/button').displayed?}
  #               driver.find_element(:xpath, '//*[@id="js__setPref"]/div/button').click() #住まい
  #               driver.find_element(:xpath, '//*[@id="js__setPref"]/div/div/ul/li[5]/a').click() #住まい
  #               driver.find_element(:xpath, '//*[@id="dp1558101020858"]').send_keys today
  #               driver.find_element(:xpath, '//*[@id="js__setWages"]/div/button').click() #price
  #               driver.find_element(:xpath, '//*[@id="js__setWages"]/div/div/ul/li[4]/a').click() #21-30
  #               driver.find_element(:xpath, '//*[@id="js__setDays"]/div/button').click()
  #               driver.find_element(:xpath, '//*[@id="js__setDays"]/div/div/ul/li[6]/a').click() #frequency
  #               driver.find_element(:xpath, '//*[@id="js__formOfferReq"]/table/tbody/tr[7]/td/input').send_keys '相談可'
  #               driver.find_element(:xpath, '//*[@id="js__formOfferReq"]/table/tbody/tr[8]/td/textarea').send_keys '上記の報酬と勤務日数は現時点のものですので、フレキシブルに対応することができます。
  #               ぜひお気軽に相談してください。'
  #
  #               if driver.find_elements(:xpath, '//*[@id="js__setDays"]/div/button').size == 1 then
  #                 driver.find_element(:xpath, '//*[@id="js__setDays"]/div/button').click
  #               end
  #
  #               #driver.find_element(:xpath, '//*[@id="js__sendOfferReq"]').click #submit
  #             rescue => e
  #               puts 'error'
  #               p e.message
  #             end
  #
  #           end
  #         else
  #           puts '募集中ではありませんでした'
  #         end
  #         driver.get page_url
  #         puts ''
  #       end
  #       #break
  #       total_tasks += tasks.size
  #       page_number += 1
  #
  #     end
  #
  #     # @repeat_list = Product.all
  #     # File.open('repeat/repeat_' + keyword +'.txt', 'w') do |file|
  #     #   new_list = todays_list | repeat_list
  #     #   file.puts new_list #２つの結果をマージしたやつ
  #     # end
  #     puts ''
  #
  #   ensure
  #     next
  #     puts 'ensure'
  #     # File.open('repeat/repeat_' + keyword +'.txt', 'w') do |file|
  #     #   # print todays_list
  #     #   # print repeat_list
  #     #   new_list = todays_list | repeat_list
  #     #   #puts new_list
  #     #   file.puts new_list #２つの結果をマージしたやつ
  #     #   #file.puts repeat_list.concat(todays_list) #２つの結果を足す,レシーバ自身を変更する
  #     # end
  #   end
  # end

ensure
 driver.quit #ブラウザ終了
end
