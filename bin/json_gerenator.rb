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
      })
    when :activity
      Activities.sample(self[1]).format_activity
    when :activity_detail
      Activities.sample.merge({
        cover: "samples/cover.jpg",
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

def t key
  Translation.fetch key.to_sym
end

def generate key, hash, options={}
  file = "#{key}.json"
  if options[:prefix]
    file = "#{options[:prefix]}/#{file}"
    Dir.mkdir(File.expand_path(options[:prefix], ApiPath)) rescue nil
  end
  json = hash.map{|k,v|[k, v.format_by_type]}.to_h.merge(success: true)
  ReadmeData[key] = {structure: hash, json: json, file: file} unless options[:nodoc]

  File.open File.expand_path(file, ApiPath), "w" do |f|
    f.puts JSON.generate json
  end
end

generate "home", {
  sf: [:music, 8],
  bd: [:music, 8],
  zx: [:news, 8],
  yygc: [:link, 4],
  yyc: [:link, 4],
  ymq: [:link, 4],
}

generate "sf", {
  sf: [:music, 10],
  totalPage: [:raw, 10],
}

generate "rmtj", {
  rmtj: [:music, 10],
}

generate "cnxh", {
  cnxh: [:music, 10],
}

generate "tt", {
  tt: [:news, 1]
}

generate "zx", {
  zx: [:news, 8],
  totalPage: [:raw, 10],
}

generate "zx_id", {
  zx: [:news_detail],
}, prefix: "zx"

generate "bd", {
  yyb: [:music, 8],
  xrb: [:music, 8],
  jqb: [:music, 8],
  clb: [:music, 8],
  ztb: [:music, 8],
  yyrb: [:music, 8],
}

generate "bd_id", {
  bd: [:music, 10],
  totalPage: [:raw, 10],
}, prefix: "bd"

generate "fl_id", {
  fl: [:music, 10],
  totalPage: [:raw, 10],
}, prefix: "fl"

generate "hd", {
  jbrd: [:activity, 6],
  yyxc: [:activity, 6],
  djtj: [:activity, 6],
}

generate "pd_id", {
  pd: [:music, 10]
}, prefix: "pd"

generate "wdcl", {
  dqcl: [:ring, 1],
}

generate "qtcl", {
  qtcl: [:ring, 3],
  totalPage: [:raw, 10],
}

generate "wdgd", {
  wdgd: [:music, 10],
  totalPage: [:raw, 10],
}

generate "music_id", {
  zf: [:music_charge],
  rmtj: [:music, 10],
  cnxh: [:music, 10],
}, prefix: "zf"

generate "search", {
  musics: [:music, 100],
  artists: [:music, 100],
  albums: [:music, 100],
}

generate "xgxw", {
  xgxw: [:news, 4],
  totalPage: [:raw, 10],
}

generate "hd_id", {
  hd: [:activity_detail],
  tjqm: [:music, 10],
}, prefix: "hd"

generate "album", {
  image: [:raw, "http://img01.12530.com/music/picture/20130708/6/7/oCDD7lrY.jpg"],
  title: [:raw, "十二新作"],
  content: [:raw, "<p>歌手：周杰伦 </p><p>语言：国语</p><p>发行时间：2012-12-28 </p><p>唱片公司：杰威尔音乐</p>"],
  description: [:raw, "周杰伦的12，代表的也是一种圆满与完全，出道第12年的第十二个月，推出一年一张的新专辑，代表着对音乐的圆满成就，也代表音乐界另一个新的大循环的预告。"],
  musics: [:music, 100]
}

generate "artist", {
  image: [:raw, "http://img01.12530.com/music/picture/20130708/6/7/oCDD7lrY.jpg"],
  title: [:raw, "周杰伦"],
  content: [:raw, "<p>歌手：周杰伦 </p><p>语言：国语</p><p>发行时间：2012-12-28 </p><p>唱片公司：杰威尔音乐</p>"],
  musics: [:music, 100]
}


generate_readme