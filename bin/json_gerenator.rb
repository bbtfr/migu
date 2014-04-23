CurrPath = File.dirname(__FILE__)
ApiPath = File.expand_path('../source/api', CurrPath)
ReadmeData = {}

# load sample data from bin/json_samples.yml
require 'yaml'
SampleData = YAML.load File.read File.expand_path("json_samples.yml", CurrPath)
Translation = SampleData[:translation]
Meta = SampleData[:meta]
Musics = SampleData[:musics] * 10
News = SampleData[:news] * 10
Activities = SampleData[:activities] * 10
Links = SampleData[:links] * 10

# generate README.md for json api
require 'erb'
def generate_readme
  File.open File.expand_path("README.md", ApiPath), "w" do |f|
    erb = ERB.new File.read File.expand_path("json_readme.md.erb", CurrPath)
    f.puts erb.result binding
  end
end

# generate 
require 'json'
class Array
  def format_music
    self.map do |hash|
      hash.merge({
        mp3: "samples/media.mp3",
        cover: "samples/cover.jpg",
        lyrics: "samples/media.lrc",
      })
    end
  end

  def format_ring
    self.format_music.map do |hash|
      hash.merge({
        due_to: Time.now,
      })
    end
  end

  def format_news
    self.map do |hash|
      hash.merge({
        image: "samples/news.jpg",
      })
    end
  end

  def format_activity
    self.map do |hash|
      hash
    end
  end


  def format_link
    self.map do |hash|
      hash
    end
  end

  def format_by_type
    case self[0]
    when :music
      Musics.sample(self[1]).format_music
    when :ring
      Musics.sample(self[1]).format_ring
    when :music_charge
      Musics.sample.merge({
        cover: "samples/cover.jpg",
        downloads: [
          {title: "下载歌曲（MP4高清版）1204K", cost: "2元"},
          {title: "下载歌曲（MP3标清版）506K", cost: "1元"},
          {title: "下载来电铃声282K", cost: "2元"},
        ],
        ring: {cost: "2元", due_to: Time.now},
        gifts: [
          {title: "下载歌曲（MP4高清版）1204K", cost: "2元"},
          {title: "下载歌曲（MP3标清版）506K", cost: "1元"},
          {title: "下载来电铃声282K", cost: "2元"},
        ],
      })
    when :news
      News.sample(self[1]).format_news
    when :news_detail
      News.sample.merge({
        created_at: Time.now,
        content: Meta[:news_detail][:content],
        image: "samples/news.jpg",
      })
    when :activity
      Activities.sample(self[1]).format_activity
    when :activity_detail
      Activities.sample.merge({
        image: "samples/news.jpg",
        content: "我的隔壁是不是住着某个可爱的外星人呢？能否和他创造出奇迹般的甜蜜浪漫呢？
400年前坠落在朝鲜的外星人，带着他迄今为止4个世纪的秘密，独自在韩国首尔的天空下生活着。",
      })
    when :link
      Links.sample(self[1]).format_link
    when :raw
      self[1]
    else
      self
    end
  end
end
