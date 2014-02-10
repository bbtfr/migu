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
        gift: {cost: "2元"},
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
}

generate "sf", {
  sf: [:music, 100],
  rmtj: [:music, 10],
  cnxh: [:music, 10],
}

generate "rmtj", {
  rmtj: [:music, 10],
}

generate "cnxh", {
  cnxh: [:music, 10],
}

generate "zx", {
  tt: [:news, 1],
  zx: [:news, 60],
}

generate "zx_id", {
  zx: [:news_detail],
  xgxw: [:news, 40],
}, prefix: "zx"

generate "bd", {
  yyb: [:music, 8],
  jqb: [:music, 8],
  clb: [:music, 8],
}

generate "bd_id", {
  bd: [:music, 100],
}, prefix: "bd"

generate "fl_id", {
  fl: [:music, 100],
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
  wdcl: [:ring, 30],
  rmtj: [:music, 10],
  cnxh: [:music, 10],
}

generate "wdgd", {
  wdgd: [:music, 100],
  rmtj: [:music, 10],
  cnxh: [:music, 10],
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

generate_readme