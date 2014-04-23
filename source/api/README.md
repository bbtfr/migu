*本文使用Markdown编写，源文件source/api/README.md，输出文件document/API_README.html*

模型
==========
音乐
----------
音乐数据包含以下字段：

    id: 音乐ID
    title: 音乐曲名
    artist: 歌手
    mp3: 音乐文件URL（MP3格式）
    cover: 音乐封皮图片URL
    lyrics: 音乐歌词lrc文件URL

例如：

```json
[
  {
    "id": 1,
    "title": "他不懂",
    "artist": "张杰",
    "mp3": "samples/media.mp3",
    "cover": "samples/cover.jpg",
    "lyrics": "samples/media.lrc"
  }
]
```

其中mp3字段可换为`其他音乐格式: 音乐文件URL`，例如：`"m4a": "samples/media.m4a"`

根据使用JS播放器库JPlayer的文档，播放器对 mp3, m4a, m4v格式支持最好，此外还支持 webma, webmv, oga, ogv, wav, fla, flv, rtmpa, rtmpv，但并不保证全平台可用。

经测试mp3格式全平台可用。

音乐资费
----------
音乐资费数据包含以下字段：

    id: 音乐ID
    title: 音乐曲名
    artist: 歌手
    cover: 音乐封皮图片URL
    ring: 彩铃音乐文件URL
    downloads: 下载类型数组，字段包含title（标题）、cost（费用）
    ring: 设为铃声资费，字段包含cost（费用）、due_to（期限）
    gift: 赠送资费，字段包含cost（费用）

例如：

```json
{
  "id": 0,
  "title": "爸爸去哪儿（湖南卫视少儿励志节目）",
  "artist": "林志颖/Kimi/张亮/张悦轩/郭涛/郭子睿/王岳伦/王诗龄",
  "cover": "samples/cover.jpg",
  "downloads": [
    {
      "title": "下载歌曲（MP4高清版）1204K",
      "cost": "2元"
    },
    {
      "title": "下载歌曲（MP3标清版）506K",
      "cost": "1元"
    },
    {
      "title": "下载来电铃声282K",
      "cost": "2元"
    }
  ],
  "ring": {
    "cost": "2元",
    "due_to": "2014-04-08 11:03:54 +0800"
  },
  "gifts": [
    {
      "title": "下载歌曲（MP4高清版）1204K",
      "cost": "2元"
    },
    {
      "title": "下载歌曲（MP3标清版）506K",
      "cost": "1元"
    },
    {
      "title": "下载来电铃声282K",
      "cost": "2元"
    }
  ]
}
```

新闻
----------
新闻数据包含以下字段：

    id: 新闻ID
    title: 新闻标题
    subtitle: 新闻副标题
    image: 新闻图片URL // 只有头条新闻需要这个字段

例如：

```json
[
  {
    "id": 3,
    "title": "冯小刚邀王菲再唱春晚 20日开始带妆彩排",
    "subtitle": "“不走寻常路”已然成为每年央视春晚[微博]导演组为了创新而遵循的法则",
    "image": "samples/news.jpg"
  }
]
```

新闻详情
----------
新闻详情数据包含以下字段：

    id: 新闻ID
    title: 新闻标题
    subtitle: 新闻副标题
    content: 新闻内容（HTML格式）

例如：

```json
{
  "id": 5,
  "title": "陈奕迅否认与经纪人闹翻 称会继续领奖",
  "subtitle": "北京时间1月6日消息，据香港媒体报导，陈奕迅[微博]日前出席《叱咤颁奖礼》被指黑面及状态欠佳",
  "created_at": "2014-04-08 11:03:54 +0800",
  "content": "<img src=\"samples/news_detail.jpg\"><p>今日，姚贝娜在圣诞夜前夕曝光了一组圣诞红唇美妆时尚大片。在这组以白色雪景与圣诞礼物为背景的时尚大片中，姚贝娜以一袭红裙装温暖出镜，在漫天飞雪中尽展亲切笑容。</p><p>近日刚刚发行了全新EP《1/2的我》的姚贝娜，不仅在音乐上勇于突破，以更全面的自己真实回归，在时尚造型上也令人愈发有期待感。此前，姚贝娜不仅多次受邀出席各品牌的时尚活动，参加各类时尚大片的拍摄，成为了新一代的时尚宠儿。在圣诞来临之际，姚贝娜特别为大家拍摄了一组以圣诞为主题的美妆大片，希望以她温暖的笑容陪大家度过这个寒冬里的圣诞节日。</p><p>此次拍摄的每张大片中，姚贝娜均以红唇与红色美衣作为主色调进行整体搭配，复古时尚，温暖笑容弥漫在温馨浪漫圣诞气氛的漫天飘雪中，甜美可人。此次的时尚大片中，姚贝娜用最简约的红色优雅与精致唯美，演绎出今冬最in的圣诞时尚感，温暖笑容与圣诞飘雪浑然天成，韵味十足。</p>"
}
```

活动
----------
活动数据包含以下字段：

    id: 活动ID
    title: 活动名称
    time: 活动时间
    location: 活动地点
    image: 活动图片URL

例如：

```json
[
  {
    "id": 0,
    "title": "全能星战",
    "time": "2013年10月18日",
    "location": "上海体育馆",
    "image": "samples/activity1.jpg"
  }
]
```

数据接口
==========
所有请求返回数据都应带有success字段（Boolean），标记数据是否正常返回
如果返回有误，success为false，同时返回数据应带有error字段（String），说明错误原因


幻灯片（Slide）接口
----------

GET api/slides.json

返回数据应包含以下字段：

``` 
slides: 幻灯片信息，包含 3 条幻灯片图片URL
```

例如：

```json
{
  "slides": [
    "samples/slide.jpg",
    "samples/slide1.jpg",
    "samples/slide2.jpg",
    "samples/slide3.jpg"
  ]
}
```


主页接口
----------

GET api/home.json



返回数据应包含以下字段：

``` 
sf: 首发信息，包含 8 条 音乐信息 
bd: 榜单信息，包含 8 条 音乐信息 
zx: 资讯信息，包含 8 条 新闻信息 
yygc: 音乐广场信息，包含 4 条 链接信息 
yyc: 音乐厂信息，包含 4 条 链接信息 
ymq: 乐迷圈信息，包含 4 条 链接信息 
```



例如：

```json
{
  "sf": [
    {
      "id": 1,
      "title": "他不懂",
      "artist": "张杰",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 1,
      "title": "他不懂",
      "artist": "张杰",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 4,
      "title": "咪咕+U",
      "artist": "金志文,周子琰",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 3,
      "title": "想着你亲爱的",
      "artist": "祁隆",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 1,
      "title": "他不懂",
      "artist": "张杰",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 1,
      "title": "他不懂",
      "artist": "张杰",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 9,
      "title": "解放(私人定制片尾曲)",
      "artist": "羽泉",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 1,
      "title": "他不懂",
      "artist": "张杰",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    }
  ],
  "bd": [
    {
      "id": 4,
      "title": "咪咕+U",
      "artist": "金志文,周子琰",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 5,
      "title": "解放(私人定制片尾曲)",
      "artist": "羽泉",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 6,
      "title": "Better Life",
      "artist": "飞儿乐团",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 3,
      "title": "想着你亲爱的",
      "artist": "祁隆",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 6,
      "title": "Better Life",
      "artist": "飞儿乐团",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 7,
      "title": "拯救(警察故事2013主题曲)",
      "artist": "成龙",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 9,
      "title": "解放(私人定制片尾曲)",
      "artist": "羽泉",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 0,
      "title": "爸爸去哪儿（湖南卫视少儿励志节目）",
      "artist": "林志颖/Kimi/张亮/张悦轩/郭涛/郭子睿/王岳伦/王诗龄",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    }
  ],
  "zx": [
    {
      "id": 0,
      "title": "[咪咕杂志]2014星凯国际城星光璀璨",
      "subtitle": "激情点燃梦想！以动感炫酷的激光秀开启全场",
      "image": "samples/news.jpg"
    },
    {
      "id": 1,
      "title": "谢霆锋甘为情牺牲生命 张柏芝近照似少女",
      "subtitle": "新浪娱乐讯 北京时间1月6日消息，据香港媒体报导，谢霆锋为电影《救火英雄》巡回宣传，",
      "image": "samples/news.jpg"
    },
    {
      "id": 3,
      "title": "冯小刚邀王菲再唱春晚 20日开始带妆彩排",
      "subtitle": "“不走寻常路”已然成为每年央视春晚[微博]导演组为了创新而遵循的法则",
      "image": "samples/news.jpg"
    },
    {
      "id": 5,
      "title": "陈奕迅否认与经纪人闹翻 称会继续领奖",
      "subtitle": "北京时间1月6日消息，据香港媒体报导，陈奕迅[微博]日前出席《叱咤颁奖礼》被指黑面及状态欠佳",
      "image": "samples/news.jpg"
    },
    {
      "id": 5,
      "title": "陈奕迅否认与经纪人闹翻 称会继续领奖",
      "subtitle": "北京时间1月6日消息，据香港媒体报导，陈奕迅[微博]日前出席《叱咤颁奖礼》被指黑面及状态欠佳",
      "image": "samples/news.jpg"
    },
    {
      "id": 4,
      "title": "苏醒自组工作室称一哥 曾打李炜遭雪藏",
      "subtitle": "新浪娱乐讯 前段时间苏醒[微博]因为殴打事件而被天娱公司雪藏200天，直到2013年12月30日苏醒才通过微博透露已被解冻出",
      "image": "samples/news.jpg"
    },
    {
      "id": 2,
      "title": "古惑仔五子赴台尝美食 无拍电影续集打算",
      "subtitle": "1月5日台北，港星郑伊健[微博]、陈小春[微博]、谢天华[微博]、钱嘉乐[微博]及林晓峰",
      "image": "samples/news.jpg"
    },
    {
      "id": 0,
      "title": "[咪咕杂志]2014星凯国际城星光璀璨",
      "subtitle": "激情点燃梦想！以动感炫酷的激光秀开启全场",
      "image": "samples/news.jpg"
    }
  ],
  "yygc": [
    {
      "url": "images/mv.png",
      "image": "images/mv.png"
    },
    {
      "url": "images/album.png",
      "image": "images/album.png"
    },
    {
      "url": "images/mv.png",
      "image": "images/mv.png"
    },
    {
      "url": "images/selected.png",
      "image": "images/selected.png"
    }
  ],
  "yyc": [
    {
      "url": "images/album.png",
      "image": "images/album.png"
    },
    {
      "url": "images/mv.png",
      "image": "images/mv.png"
    },
    {
      "url": "images/activities.png",
      "image": "images/activities.png"
    },
    {
      "url": "images/selected.png",
      "image": "images/selected.png"
    }
  ],
  "ymq": [
    {
      "url": "images/mv.png",
      "image": "images/mv.png"
    },
    {
      "url": "images/activities.png",
      "image": "images/activities.png"
    },
    {
      "url": "images/selected.png",
      "image": "images/selected.png"
    },
    {
      "url": "images/selected.png",
      "image": "images/selected.png"
    }
  ],
  "success": true
}
```




首发接口
----------

GET api/sf.json



返回数据应包含以下字段：

``` 
sf: 首发信息，包含 10 条 音乐信息 
totalPage: 总页数信息，包含 10 条 信息 
```



例如：

```json
{
  "sf": [
    {
      "id": 3,
      "title": "想着你亲爱的",
      "artist": "祁隆",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 0,
      "title": "爸爸去哪儿（湖南卫视少儿励志节目）",
      "artist": "林志颖/Kimi/张亮/张悦轩/郭涛/郭子睿/王岳伦/王诗龄",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 6,
      "title": "Better Life",
      "artist": "飞儿乐团",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 7,
      "title": "拯救(警察故事2013主题曲)",
      "artist": "成龙",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 9,
      "title": "解放(私人定制片尾曲)",
      "artist": "羽泉",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 9,
      "title": "解放(私人定制片尾曲)",
      "artist": "羽泉",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 5,
      "title": "解放(私人定制片尾曲)",
      "artist": "羽泉",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 8,
      "title": "咪咕+U",
      "artist": "金志文,周子琰",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 5,
      "title": "解放(私人定制片尾曲)",
      "artist": "羽泉",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 6,
      "title": "Better Life",
      "artist": "飞儿乐团",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    }
  ],
  "totalPage": 10,
  "success": true
}
```




热门推荐接口
----------

GET api/rmtj.json



返回数据应包含以下字段：

``` 
rmtj: 热门推荐信息，包含 10 条 音乐信息 
```



例如：

```json
{
  "rmtj": [
    {
      "id": 2,
      "title": "爱就要爆灯",
      "artist": "龙梅子",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 1,
      "title": "他不懂",
      "artist": "张杰",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 8,
      "title": "咪咕+U",
      "artist": "金志文,周子琰",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 9,
      "title": "解放(私人定制片尾曲)",
      "artist": "羽泉",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 0,
      "title": "爸爸去哪儿（湖南卫视少儿励志节目）",
      "artist": "林志颖/Kimi/张亮/张悦轩/郭涛/郭子睿/王岳伦/王诗龄",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 0,
      "title": "爸爸去哪儿（湖南卫视少儿励志节目）",
      "artist": "林志颖/Kimi/张亮/张悦轩/郭涛/郭子睿/王岳伦/王诗龄",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 5,
      "title": "解放(私人定制片尾曲)",
      "artist": "羽泉",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 1,
      "title": "他不懂",
      "artist": "张杰",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 8,
      "title": "咪咕+U",
      "artist": "金志文,周子琰",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 5,
      "title": "解放(私人定制片尾曲)",
      "artist": "羽泉",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    }
  ],
  "success": true
}
```




猜你喜欢接口
----------

GET api/cnxh.json



返回数据应包含以下字段：

``` 
cnxh: 猜你喜欢信息，包含 10 条 音乐信息 
```



例如：

```json
{
  "cnxh": [
    {
      "id": 7,
      "title": "拯救(警察故事2013主题曲)",
      "artist": "成龙",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 0,
      "title": "爸爸去哪儿（湖南卫视少儿励志节目）",
      "artist": "林志颖/Kimi/张亮/张悦轩/郭涛/郭子睿/王岳伦/王诗龄",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 5,
      "title": "解放(私人定制片尾曲)",
      "artist": "羽泉",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 8,
      "title": "咪咕+U",
      "artist": "金志文,周子琰",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 5,
      "title": "解放(私人定制片尾曲)",
      "artist": "羽泉",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 0,
      "title": "爸爸去哪儿（湖南卫视少儿励志节目）",
      "artist": "林志颖/Kimi/张亮/张悦轩/郭涛/郭子睿/王岳伦/王诗龄",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 8,
      "title": "咪咕+U",
      "artist": "金志文,周子琰",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 2,
      "title": "爱就要爆灯",
      "artist": "龙梅子",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 1,
      "title": "他不懂",
      "artist": "张杰",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 3,
      "title": "想着你亲爱的",
      "artist": "祁隆",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    }
  ],
  "success": true
}
```




头条接口
----------

GET api/tt.json



返回数据应包含以下字段：

``` 
tt: 头条信息，包含 1 条 新闻信息 
```



例如：

```json
{
  "tt": [
    {
      "id": 3,
      "title": "冯小刚邀王菲再唱春晚 20日开始带妆彩排",
      "subtitle": "“不走寻常路”已然成为每年央视春晚[微博]导演组为了创新而遵循的法则",
      "image": "samples/news.jpg"
    }
  ],
  "success": true
}
```




资讯接口
----------

GET api/zx.json



返回数据应包含以下字段：

``` 
zx: 资讯信息，包含 8 条 新闻信息 
totalPage: 总页数信息，包含 10 条 信息 
```



例如：

```json
{
  "zx": [
    {
      "id": 2,
      "title": "古惑仔五子赴台尝美食 无拍电影续集打算",
      "subtitle": "1月5日台北，港星郑伊健[微博]、陈小春[微博]、谢天华[微博]、钱嘉乐[微博]及林晓峰",
      "image": "samples/news.jpg"
    },
    {
      "id": 3,
      "title": "冯小刚邀王菲再唱春晚 20日开始带妆彩排",
      "subtitle": "“不走寻常路”已然成为每年央视春晚[微博]导演组为了创新而遵循的法则",
      "image": "samples/news.jpg"
    },
    {
      "id": 3,
      "title": "冯小刚邀王菲再唱春晚 20日开始带妆彩排",
      "subtitle": "“不走寻常路”已然成为每年央视春晚[微博]导演组为了创新而遵循的法则",
      "image": "samples/news.jpg"
    },
    {
      "id": 4,
      "title": "苏醒自组工作室称一哥 曾打李炜遭雪藏",
      "subtitle": "新浪娱乐讯 前段时间苏醒[微博]因为殴打事件而被天娱公司雪藏200天，直到2013年12月30日苏醒才通过微博透露已被解冻出",
      "image": "samples/news.jpg"
    },
    {
      "id": 4,
      "title": "苏醒自组工作室称一哥 曾打李炜遭雪藏",
      "subtitle": "新浪娱乐讯 前段时间苏醒[微博]因为殴打事件而被天娱公司雪藏200天，直到2013年12月30日苏醒才通过微博透露已被解冻出",
      "image": "samples/news.jpg"
    },
    {
      "id": 3,
      "title": "冯小刚邀王菲再唱春晚 20日开始带妆彩排",
      "subtitle": "“不走寻常路”已然成为每年央视春晚[微博]导演组为了创新而遵循的法则",
      "image": "samples/news.jpg"
    },
    {
      "id": 1,
      "title": "谢霆锋甘为情牺牲生命 张柏芝近照似少女",
      "subtitle": "新浪娱乐讯 北京时间1月6日消息，据香港媒体报导，谢霆锋为电影《救火英雄》巡回宣传，",
      "image": "samples/news.jpg"
    },
    {
      "id": 0,
      "title": "[咪咕杂志]2014星凯国际城星光璀璨",
      "subtitle": "激情点燃梦想！以动感炫酷的激光秀开启全场",
      "image": "samples/news.jpg"
    }
  ],
  "totalPage": 10,
  "success": true
}
```




新闻详情接口
----------

GET api/zx/zx_id.json

其中，zx_id指新闻数据中的id字段

返回数据应包含以下字段：

``` 
zx: 资讯信息，包含 1 条 新闻详情信息 
```



例如：

```json
{
  "zx": {
    "id": 5,
    "title": "陈奕迅否认与经纪人闹翻 称会继续领奖",
    "subtitle": "北京时间1月6日消息，据香港媒体报导，陈奕迅[微博]日前出席《叱咤颁奖礼》被指黑面及状态欠佳",
    "created_at": "2014-04-08 11:03:54 +0800",
    "content": "<img src=\"samples/news_detail.jpg\"><p>今日，姚贝娜在圣诞夜前夕曝光了一组圣诞红唇美妆时尚大片。在这组以白色雪景与圣诞礼物为背景的时尚大片中，姚贝娜以一袭红裙装温暖出镜，在漫天飞雪中尽展亲切笑容。</p><p>近日刚刚发行了全新EP《1/2的我》的姚贝娜，不仅在音乐上勇于突破，以更全面的自己真实回归，在时尚造型上也令人愈发有期待感。此前，姚贝娜不仅多次受邀出席各品牌的时尚活动，参加各类时尚大片的拍摄，成为了新一代的时尚宠儿。在圣诞来临之际，姚贝娜特别为大家拍摄了一组以圣诞为主题的美妆大片，希望以她温暖的笑容陪大家度过这个寒冬里的圣诞节日。</p><p>此次拍摄的每张大片中，姚贝娜均以红唇与红色美衣作为主色调进行整体搭配，复古时尚，温暖笑容弥漫在温馨浪漫圣诞气氛的漫天飘雪中，甜美可人。此次的时尚大片中，姚贝娜用最简约的红色优雅与精致唯美，演绎出今冬最in的圣诞时尚感，温暖笑容与圣诞飘雪浑然天成，韵味十足。</p>"
  },
  "success": true
}
```




榜单接口
----------

GET api/bd.json



返回数据应包含以下字段：

``` 
yyb: 音乐榜信息，包含 8 条 音乐信息 
xrb: 新人榜信息，包含 8 条 音乐信息 
jqb: 金曲榜信息，包含 8 条 音乐信息 
clb: 彩铃榜信息，包含 8 条 音乐信息 
ztb: 专题榜信息，包含 8 条 音乐信息 
yyrb: 音乐人榜信息，包含 8 条 音乐信息 
```



例如：

```json
{
  "yyb": [
    {
      "id": 0,
      "title": "爸爸去哪儿（湖南卫视少儿励志节目）",
      "artist": "林志颖/Kimi/张亮/张悦轩/郭涛/郭子睿/王岳伦/王诗龄",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 4,
      "title": "咪咕+U",
      "artist": "金志文,周子琰",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 7,
      "title": "拯救(警察故事2013主题曲)",
      "artist": "成龙",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 3,
      "title": "想着你亲爱的",
      "artist": "祁隆",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 3,
      "title": "想着你亲爱的",
      "artist": "祁隆",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 6,
      "title": "Better Life",
      "artist": "飞儿乐团",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 8,
      "title": "咪咕+U",
      "artist": "金志文,周子琰",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 9,
      "title": "解放(私人定制片尾曲)",
      "artist": "羽泉",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    }
  ],
  "xrb": [
    {
      "id": 0,
      "title": "爸爸去哪儿（湖南卫视少儿励志节目）",
      "artist": "林志颖/Kimi/张亮/张悦轩/郭涛/郭子睿/王岳伦/王诗龄",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 2,
      "title": "爱就要爆灯",
      "artist": "龙梅子",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 9,
      "title": "解放(私人定制片尾曲)",
      "artist": "羽泉",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 2,
      "title": "爱就要爆灯",
      "artist": "龙梅子",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 6,
      "title": "Better Life",
      "artist": "飞儿乐团",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 3,
      "title": "想着你亲爱的",
      "artist": "祁隆",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 7,
      "title": "拯救(警察故事2013主题曲)",
      "artist": "成龙",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 6,
      "title": "Better Life",
      "artist": "飞儿乐团",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    }
  ],
  "jqb": [
    {
      "id": 0,
      "title": "爸爸去哪儿（湖南卫视少儿励志节目）",
      "artist": "林志颖/Kimi/张亮/张悦轩/郭涛/郭子睿/王岳伦/王诗龄",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 4,
      "title": "咪咕+U",
      "artist": "金志文,周子琰",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 1,
      "title": "他不懂",
      "artist": "张杰",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 6,
      "title": "Better Life",
      "artist": "飞儿乐团",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 3,
      "title": "想着你亲爱的",
      "artist": "祁隆",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 1,
      "title": "他不懂",
      "artist": "张杰",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 9,
      "title": "解放(私人定制片尾曲)",
      "artist": "羽泉",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 2,
      "title": "爱就要爆灯",
      "artist": "龙梅子",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    }
  ],
  "clb": [
    {
      "id": 7,
      "title": "拯救(警察故事2013主题曲)",
      "artist": "成龙",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 5,
      "title": "解放(私人定制片尾曲)",
      "artist": "羽泉",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 3,
      "title": "想着你亲爱的",
      "artist": "祁隆",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 3,
      "title": "想着你亲爱的",
      "artist": "祁隆",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 1,
      "title": "他不懂",
      "artist": "张杰",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 7,
      "title": "拯救(警察故事2013主题曲)",
      "artist": "成龙",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 8,
      "title": "咪咕+U",
      "artist": "金志文,周子琰",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 8,
      "title": "咪咕+U",
      "artist": "金志文,周子琰",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    }
  ],
  "ztb": [
    {
      "id": 0,
      "title": "爸爸去哪儿（湖南卫视少儿励志节目）",
      "artist": "林志颖/Kimi/张亮/张悦轩/郭涛/郭子睿/王岳伦/王诗龄",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 2,
      "title": "爱就要爆灯",
      "artist": "龙梅子",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 2,
      "title": "爱就要爆灯",
      "artist": "龙梅子",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 8,
      "title": "咪咕+U",
      "artist": "金志文,周子琰",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 6,
      "title": "Better Life",
      "artist": "飞儿乐团",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 6,
      "title": "Better Life",
      "artist": "飞儿乐团",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 1,
      "title": "他不懂",
      "artist": "张杰",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 6,
      "title": "Better Life",
      "artist": "飞儿乐团",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    }
  ],
  "yyrb": [
    {
      "id": 0,
      "title": "爸爸去哪儿（湖南卫视少儿励志节目）",
      "artist": "林志颖/Kimi/张亮/张悦轩/郭涛/郭子睿/王岳伦/王诗龄",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 5,
      "title": "解放(私人定制片尾曲)",
      "artist": "羽泉",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 1,
      "title": "他不懂",
      "artist": "张杰",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 1,
      "title": "他不懂",
      "artist": "张杰",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 6,
      "title": "Better Life",
      "artist": "飞儿乐团",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 0,
      "title": "爸爸去哪儿（湖南卫视少儿励志节目）",
      "artist": "林志颖/Kimi/张亮/张悦轩/郭涛/郭子睿/王岳伦/王诗龄",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 4,
      "title": "咪咕+U",
      "artist": "金志文,周子琰",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 8,
      "title": "咪咕+U",
      "artist": "金志文,周子琰",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    }
  ],
  "success": true
}
```




榜单详情接口
----------

GET api/bd/bd_id.json

其中，bd_id指榜单中文拼音首字母，例如：yyb（音乐榜）、jqb（金曲榜）、clb（彩铃榜），__待定__

返回数据应包含以下字段：

``` 
bd: 榜单信息，包含 10 条 音乐信息 
totalPage: 总页数信息，包含 10 条 信息 
```



例如：

```json
{
  "bd": [
    {
      "id": 6,
      "title": "Better Life",
      "artist": "飞儿乐团",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 0,
      "title": "爸爸去哪儿（湖南卫视少儿励志节目）",
      "artist": "林志颖/Kimi/张亮/张悦轩/郭涛/郭子睿/王岳伦/王诗龄",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 0,
      "title": "爸爸去哪儿（湖南卫视少儿励志节目）",
      "artist": "林志颖/Kimi/张亮/张悦轩/郭涛/郭子睿/王岳伦/王诗龄",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 1,
      "title": "他不懂",
      "artist": "张杰",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 2,
      "title": "爱就要爆灯",
      "artist": "龙梅子",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 1,
      "title": "他不懂",
      "artist": "张杰",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 7,
      "title": "拯救(警察故事2013主题曲)",
      "artist": "成龙",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 5,
      "title": "解放(私人定制片尾曲)",
      "artist": "羽泉",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 0,
      "title": "爸爸去哪儿（湖南卫视少儿励志节目）",
      "artist": "林志颖/Kimi/张亮/张悦轩/郭涛/郭子睿/王岳伦/王诗龄",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 3,
      "title": "想着你亲爱的",
      "artist": "祁隆",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    }
  ],
  "totalPage": 10,
  "success": true
}
```




分类详情接口
----------

GET api/fl/fl_id.json

其中，fl_id指分类中文拼音首字母，标点符号忽略，数字保留，例如：wl（网络）、wqdz（舞曲/电子）、90h（90后），__待定__

返回数据应包含以下字段：

``` 
fl: 分类信息，包含 10 条 音乐信息 
totalPage: 总页数信息，包含 10 条 信息 
```



例如：

```json
{
  "fl": [
    {
      "id": 6,
      "title": "Better Life",
      "artist": "飞儿乐团",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 5,
      "title": "解放(私人定制片尾曲)",
      "artist": "羽泉",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 5,
      "title": "解放(私人定制片尾曲)",
      "artist": "羽泉",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 6,
      "title": "Better Life",
      "artist": "飞儿乐团",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 1,
      "title": "他不懂",
      "artist": "张杰",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 6,
      "title": "Better Life",
      "artist": "飞儿乐团",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 1,
      "title": "他不懂",
      "artist": "张杰",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 8,
      "title": "咪咕+U",
      "artist": "金志文,周子琰",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 4,
      "title": "咪咕+U",
      "artist": "金志文,周子琰",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 6,
      "title": "Better Life",
      "artist": "飞儿乐团",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    }
  ],
  "totalPage": 10,
  "success": true
}
```




活动接口
----------

GET api/hd.json



返回数据应包含以下字段：

``` 
jbrd: 劲爆热点信息，包含 6 条 活动信息 
yyxc: 音乐现场信息，包含 6 条 活动信息 
djtj: 独家推荐信息，包含 6 条 活动信息 
```



例如：

```json
{
  "jbrd": [
    {
      "id": 5,
      "title": "2014陈绮贞“时间的歌” 深圳全新演唱会",
      "time": "2014-01-04",
      "location": "华润深圳湾体育中心",
      "image": "samples/activity6.jpg"
    },
    {
      "id": 3,
      "title": "汪峰11月9日上海演唱会抢票！",
      "time": "11月09日",
      "location": "上海体育馆",
      "image": "samples/activity4.jpg"
    },
    {
      "id": 4,
      "title": "10月20日S.H.E天津演唱会抢票",
      "time": "2013-10-20",
      "location": "天津体育中心",
      "image": "samples/activity5.jpg"
    },
    {
      "id": 1,
      "title": "周杰伦11月24日深圳演唱会",
      "time": "2013-11-24",
      "location": "华润深圳湾体育中心“春茧”体育场",
      "image": "samples/activity2.jpg"
    },
    {
      "id": 3,
      "title": "汪峰11月9日上海演唱会抢票！",
      "time": "11月09日",
      "location": "上海体育馆",
      "image": "samples/activity4.jpg"
    },
    {
      "id": 2,
      "title": "陈楚生11月15日江苏南京歌友会",
      "time": "2013-11-15",
      "location": "南京青春剧场",
      "image": "samples/activity3.jpg"
    }
  ],
  "yyxc": [
    {
      "id": 0,
      "title": "全能星战",
      "time": "2013年10月18日",
      "location": "上海体育馆",
      "image": "samples/activity1.jpg"
    },
    {
      "id": 1,
      "title": "周杰伦11月24日深圳演唱会",
      "time": "2013-11-24",
      "location": "华润深圳湾体育中心“春茧”体育场",
      "image": "samples/activity2.jpg"
    },
    {
      "id": 5,
      "title": "2014陈绮贞“时间的歌” 深圳全新演唱会",
      "time": "2014-01-04",
      "location": "华润深圳湾体育中心",
      "image": "samples/activity6.jpg"
    },
    {
      "id": 4,
      "title": "10月20日S.H.E天津演唱会抢票",
      "time": "2013-10-20",
      "location": "天津体育中心",
      "image": "samples/activity5.jpg"
    },
    {
      "id": 2,
      "title": "陈楚生11月15日江苏南京歌友会",
      "time": "2013-11-15",
      "location": "南京青春剧场",
      "image": "samples/activity3.jpg"
    },
    {
      "id": 3,
      "title": "汪峰11月9日上海演唱会抢票！",
      "time": "11月09日",
      "location": "上海体育馆",
      "image": "samples/activity4.jpg"
    }
  ],
  "djtj": [
    {
      "id": 5,
      "title": "2014陈绮贞“时间的歌” 深圳全新演唱会",
      "time": "2014-01-04",
      "location": "华润深圳湾体育中心",
      "image": "samples/activity6.jpg"
    },
    {
      "id": 0,
      "title": "全能星战",
      "time": "2013年10月18日",
      "location": "上海体育馆",
      "image": "samples/activity1.jpg"
    },
    {
      "id": 5,
      "title": "2014陈绮贞“时间的歌” 深圳全新演唱会",
      "time": "2014-01-04",
      "location": "华润深圳湾体育中心",
      "image": "samples/activity6.jpg"
    },
    {
      "id": 4,
      "title": "10月20日S.H.E天津演唱会抢票",
      "time": "2013-10-20",
      "location": "天津体育中心",
      "image": "samples/activity5.jpg"
    },
    {
      "id": 2,
      "title": "陈楚生11月15日江苏南京歌友会",
      "time": "2013-11-15",
      "location": "南京青春剧场",
      "image": "samples/activity3.jpg"
    },
    {
      "id": 1,
      "title": "周杰伦11月24日深圳演唱会",
      "time": "2013-11-24",
      "location": "华润深圳湾体育中心“春茧”体育场",
      "image": "samples/activity2.jpg"
    }
  ],
  "success": true
}
```




随便听听频道接口
----------

GET api/pd/pd_id.json

其中，pd_id指分类中文拼音首字母，标点符号忽略，数字保留，例如：wl（网络）、wqdz（舞曲/电子）、90h（90后），__待定__

返回数据应包含以下字段：

``` 
pd: 频道信息，包含 10 条 音乐信息 
```



例如：

```json
{
  "pd": [
    {
      "id": 8,
      "title": "咪咕+U",
      "artist": "金志文,周子琰",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 4,
      "title": "咪咕+U",
      "artist": "金志文,周子琰",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 4,
      "title": "咪咕+U",
      "artist": "金志文,周子琰",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 3,
      "title": "想着你亲爱的",
      "artist": "祁隆",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 1,
      "title": "他不懂",
      "artist": "张杰",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 8,
      "title": "咪咕+U",
      "artist": "金志文,周子琰",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 1,
      "title": "他不懂",
      "artist": "张杰",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 8,
      "title": "咪咕+U",
      "artist": "金志文,周子琰",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 1,
      "title": "他不懂",
      "artist": "张杰",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 2,
      "title": "爱就要爆灯",
      "artist": "龙梅子",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    }
  ],
  "success": true
}
```




我的彩铃接口
----------

GET api/wdcl.json



返回数据应包含以下字段：

``` 
dqcl: 当前彩铃信息，包含 1 条 彩铃信息 
```



例如：

```json
{
  "dqcl": [
    {
      "id": 8,
      "title": "咪咕+U",
      "artist": "金志文,周子琰",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc",
      "due_to": "2014-04-08 11:03:54 +0800"
    }
  ],
  "success": true
}
```




其他彩铃接口
----------

GET api/qtcl.json



返回数据应包含以下字段：

``` 
qtcl: 其他彩铃信息，包含 3 条 彩铃信息 
totalPage: 总页数信息，包含 10 条 信息 
```



例如：

```json
{
  "qtcl": [
    {
      "id": 6,
      "title": "Better Life",
      "artist": "飞儿乐团",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc",
      "due_to": "2014-04-08 11:03:54 +0800"
    },
    {
      "id": 2,
      "title": "爱就要爆灯",
      "artist": "龙梅子",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc",
      "due_to": "2014-04-08 11:03:54 +0800"
    },
    {
      "id": 2,
      "title": "爱就要爆灯",
      "artist": "龙梅子",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc",
      "due_to": "2014-04-08 11:03:54 +0800"
    }
  ],
  "totalPage": 10,
  "success": true
}
```




我的歌单接口
----------

GET api/wdgd.json



返回数据应包含以下字段：

``` 
wdgd: 我的歌单信息，包含 10 条 音乐信息 
totalPage: 总页数信息，包含 10 条 信息 
```



例如：

```json
{
  "wdgd": [
    {
      "id": 8,
      "title": "咪咕+U",
      "artist": "金志文,周子琰",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 5,
      "title": "解放(私人定制片尾曲)",
      "artist": "羽泉",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 2,
      "title": "爱就要爆灯",
      "artist": "龙梅子",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 8,
      "title": "咪咕+U",
      "artist": "金志文,周子琰",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 5,
      "title": "解放(私人定制片尾曲)",
      "artist": "羽泉",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 6,
      "title": "Better Life",
      "artist": "飞儿乐团",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 4,
      "title": "咪咕+U",
      "artist": "金志文,周子琰",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 6,
      "title": "Better Life",
      "artist": "飞儿乐团",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 1,
      "title": "他不懂",
      "artist": "张杰",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 1,
      "title": "他不懂",
      "artist": "张杰",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    }
  ],
  "totalPage": 10,
  "success": true
}
```




音乐资费接口
----------

GET api/zf/music_id.json



返回数据应包含以下字段：

``` 
zf: 资费信息，包含 1 条 音乐资费信息 
rmtj: 热门推荐信息，包含 10 条 音乐信息 
cnxh: 猜你喜欢信息，包含 10 条 音乐信息 
```



例如：

```json
{
  "zf": {
    "id": 5,
    "title": "解放(私人定制片尾曲)",
    "artist": "羽泉",
    "cover": "samples/cover.jpg",
    "downloads": [
      {
        "title": "下载歌曲（MP4高清版）1204K",
        "cost": "2元"
      },
      {
        "title": "下载歌曲（MP3标清版）506K",
        "cost": "1元"
      },
      {
        "title": "下载来电铃声282K",
        "cost": "2元"
      }
    ],
    "ring": {
      "cost": "2元",
      "due_to": "2014-04-08 11:03:54 +0800"
    },
    "gifts": [
      {
        "title": "下载歌曲（MP4高清版）1204K",
        "cost": "2元"
      },
      {
        "title": "下载歌曲（MP3标清版）506K",
        "cost": "1元"
      },
      {
        "title": "下载来电铃声282K",
        "cost": "2元"
      }
    ]
  },
  "rmtj": [
    {
      "id": 7,
      "title": "拯救(警察故事2013主题曲)",
      "artist": "成龙",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 5,
      "title": "解放(私人定制片尾曲)",
      "artist": "羽泉",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 5,
      "title": "解放(私人定制片尾曲)",
      "artist": "羽泉",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 7,
      "title": "拯救(警察故事2013主题曲)",
      "artist": "成龙",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 1,
      "title": "他不懂",
      "artist": "张杰",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 2,
      "title": "爱就要爆灯",
      "artist": "龙梅子",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 5,
      "title": "解放(私人定制片尾曲)",
      "artist": "羽泉",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 2,
      "title": "爱就要爆灯",
      "artist": "龙梅子",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 9,
      "title": "解放(私人定制片尾曲)",
      "artist": "羽泉",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 4,
      "title": "咪咕+U",
      "artist": "金志文,周子琰",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    }
  ],
  "cnxh": [
    {
      "id": 3,
      "title": "想着你亲爱的",
      "artist": "祁隆",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 1,
      "title": "他不懂",
      "artist": "张杰",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 8,
      "title": "咪咕+U",
      "artist": "金志文,周子琰",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 0,
      "title": "爸爸去哪儿（湖南卫视少儿励志节目）",
      "artist": "林志颖/Kimi/张亮/张悦轩/郭涛/郭子睿/王岳伦/王诗龄",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 0,
      "title": "爸爸去哪儿（湖南卫视少儿励志节目）",
      "artist": "林志颖/Kimi/张亮/张悦轩/郭涛/郭子睿/王岳伦/王诗龄",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 3,
      "title": "想着你亲爱的",
      "artist": "祁隆",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 1,
      "title": "他不懂",
      "artist": "张杰",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 7,
      "title": "拯救(警察故事2013主题曲)",
      "artist": "成龙",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 8,
      "title": "咪咕+U",
      "artist": "金志文,周子琰",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 0,
      "title": "爸爸去哪儿（湖南卫视少儿励志节目）",
      "artist": "林志颖/Kimi/张亮/张悦轩/郭涛/郭子睿/王岳伦/王诗龄",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    }
  ],
  "success": true
}
```




搜索接口
----------

GET api/search.json

请求包括参数query，即：api/search.json?query=搜索关键字

返回数据应包含以下字段：

``` 
musics: 音乐信息，包含 100 条 音乐信息 
artists: 歌手信息，包含 100 条 音乐信息 
albums: 专辑信息，包含 100 条 音乐信息 
```



例如：

```json
{
  "musics": [
    {
      "id": 0,
      "title": "爸爸去哪儿（湖南卫视少儿励志节目）",
      "artist": "林志颖/Kimi/张亮/张悦轩/郭涛/郭子睿/王岳伦/王诗龄",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 1,
      "title": "他不懂",
      "artist": "张杰",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 0,
      "title": "爸爸去哪儿（湖南卫视少儿励志节目）",
      "artist": "林志颖/Kimi/张亮/张悦轩/郭涛/郭子睿/王岳伦/王诗龄",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 5,
      "title": "解放(私人定制片尾曲)",
      "artist": "羽泉",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 0,
      "title": "爸爸去哪儿（湖南卫视少儿励志节目）",
      "artist": "林志颖/Kimi/张亮/张悦轩/郭涛/郭子睿/王岳伦/王诗龄",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 0,
      "title": "爸爸去哪儿（湖南卫视少儿励志节目）",
      "artist": "林志颖/Kimi/张亮/张悦轩/郭涛/郭子睿/王岳伦/王诗龄",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 1,
      "title": "他不懂",
      "artist": "张杰",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 1,
      "title": "他不懂",
      "artist": "张杰",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 3,
      "title": "想着你亲爱的",
      "artist": "祁隆",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 9,
      "title": "解放(私人定制片尾曲)",
      "artist": "羽泉",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 8,
      "title": "咪咕+U",
      "artist": "金志文,周子琰",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 7,
      "title": "拯救(警察故事2013主题曲)",
      "artist": "成龙",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 9,
      "title": "解放(私人定制片尾曲)",
      "artist": "羽泉",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 4,
      "title": "咪咕+U",
      "artist": "金志文,周子琰",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 3,
      "title": "想着你亲爱的",
      "artist": "祁隆",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 9,
      "title": "解放(私人定制片尾曲)",
      "artist": "羽泉",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 7,
      "title": "拯救(警察故事2013主题曲)",
      "artist": "成龙",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 2,
      "title": "爱就要爆灯",
      "artist": "龙梅子",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 0,
      "title": "爸爸去哪儿（湖南卫视少儿励志节目）",
      "artist": "林志颖/Kimi/张亮/张悦轩/郭涛/郭子睿/王岳伦/王诗龄",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 3,
      "title": "想着你亲爱的",
      "artist": "祁隆",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 0,
      "title": "爸爸去哪儿（湖南卫视少儿励志节目）",
      "artist": "林志颖/Kimi/张亮/张悦轩/郭涛/郭子睿/王岳伦/王诗龄",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 3,
      "title": "想着你亲爱的",
      "artist": "祁隆",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 8,
      "title": "咪咕+U",
      "artist": "金志文,周子琰",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 2,
      "title": "爱就要爆灯",
      "artist": "龙梅子",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 9,
      "title": "解放(私人定制片尾曲)",
      "artist": "羽泉",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 4,
      "title": "咪咕+U",
      "artist": "金志文,周子琰",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 9,
      "title": "解放(私人定制片尾曲)",
      "artist": "羽泉",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 5,
      "title": "解放(私人定制片尾曲)",
      "artist": "羽泉",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 3,
      "title": "想着你亲爱的",
      "artist": "祁隆",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 0,
      "title": "爸爸去哪儿（湖南卫视少儿励志节目）",
      "artist": "林志颖/Kimi/张亮/张悦轩/郭涛/郭子睿/王岳伦/王诗龄",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 8,
      "title": "咪咕+U",
      "artist": "金志文,周子琰",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 6,
      "title": "Better Life",
      "artist": "飞儿乐团",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 5,
      "title": "解放(私人定制片尾曲)",
      "artist": "羽泉",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 2,
      "title": "爱就要爆灯",
      "artist": "龙梅子",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 5,
      "title": "解放(私人定制片尾曲)",
      "artist": "羽泉",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 4,
      "title": "咪咕+U",
      "artist": "金志文,周子琰",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 6,
      "title": "Better Life",
      "artist": "飞儿乐团",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 7,
      "title": "拯救(警察故事2013主题曲)",
      "artist": "成龙",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 8,
      "title": "咪咕+U",
      "artist": "金志文,周子琰",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 0,
      "title": "爸爸去哪儿（湖南卫视少儿励志节目）",
      "artist": "林志颖/Kimi/张亮/张悦轩/郭涛/郭子睿/王岳伦/王诗龄",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 1,
      "title": "他不懂",
      "artist": "张杰",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 8,
      "title": "咪咕+U",
      "artist": "金志文,周子琰",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 1,
      "title": "他不懂",
      "artist": "张杰",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 9,
      "title": "解放(私人定制片尾曲)",
      "artist": "羽泉",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 1,
      "title": "他不懂",
      "artist": "张杰",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 7,
      "title": "拯救(警察故事2013主题曲)",
      "artist": "成龙",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 8,
      "title": "咪咕+U",
      "artist": "金志文,周子琰",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 6,
      "title": "Better Life",
      "artist": "飞儿乐团",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 2,
      "title": "爱就要爆灯",
      "artist": "龙梅子",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 4,
      "title": "咪咕+U",
      "artist": "金志文,周子琰",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 6,
      "title": "Better Life",
      "artist": "飞儿乐团",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 4,
      "title": "咪咕+U",
      "artist": "金志文,周子琰",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 4,
      "title": "咪咕+U",
      "artist": "金志文,周子琰",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 4,
      "title": "咪咕+U",
      "artist": "金志文,周子琰",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 1,
      "title": "他不懂",
      "artist": "张杰",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 7,
      "title": "拯救(警察故事2013主题曲)",
      "artist": "成龙",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 1,
      "title": "他不懂",
      "artist": "张杰",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 2,
      "title": "爱就要爆灯",
      "artist": "龙梅子",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 9,
      "title": "解放(私人定制片尾曲)",
      "artist": "羽泉",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 5,
      "title": "解放(私人定制片尾曲)",
      "artist": "羽泉",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 3,
      "title": "想着你亲爱的",
      "artist": "祁隆",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 3,
      "title": "想着你亲爱的",
      "artist": "祁隆",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 0,
      "title": "爸爸去哪儿（湖南卫视少儿励志节目）",
      "artist": "林志颖/Kimi/张亮/张悦轩/郭涛/郭子睿/王岳伦/王诗龄",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 2,
      "title": "爱就要爆灯",
      "artist": "龙梅子",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 3,
      "title": "想着你亲爱的",
      "artist": "祁隆",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 3,
      "title": "想着你亲爱的",
      "artist": "祁隆",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 8,
      "title": "咪咕+U",
      "artist": "金志文,周子琰",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 4,
      "title": "咪咕+U",
      "artist": "金志文,周子琰",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 5,
      "title": "解放(私人定制片尾曲)",
      "artist": "羽泉",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 6,
      "title": "Better Life",
      "artist": "飞儿乐团",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 2,
      "title": "爱就要爆灯",
      "artist": "龙梅子",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 8,
      "title": "咪咕+U",
      "artist": "金志文,周子琰",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 7,
      "title": "拯救(警察故事2013主题曲)",
      "artist": "成龙",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 5,
      "title": "解放(私人定制片尾曲)",
      "artist": "羽泉",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 1,
      "title": "他不懂",
      "artist": "张杰",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 1,
      "title": "他不懂",
      "artist": "张杰",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 5,
      "title": "解放(私人定制片尾曲)",
      "artist": "羽泉",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 9,
      "title": "解放(私人定制片尾曲)",
      "artist": "羽泉",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 4,
      "title": "咪咕+U",
      "artist": "金志文,周子琰",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 7,
      "title": "拯救(警察故事2013主题曲)",
      "artist": "成龙",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 8,
      "title": "咪咕+U",
      "artist": "金志文,周子琰",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 9,
      "title": "解放(私人定制片尾曲)",
      "artist": "羽泉",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 3,
      "title": "想着你亲爱的",
      "artist": "祁隆",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 6,
      "title": "Better Life",
      "artist": "飞儿乐团",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 0,
      "title": "爸爸去哪儿（湖南卫视少儿励志节目）",
      "artist": "林志颖/Kimi/张亮/张悦轩/郭涛/郭子睿/王岳伦/王诗龄",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 8,
      "title": "咪咕+U",
      "artist": "金志文,周子琰",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 6,
      "title": "Better Life",
      "artist": "飞儿乐团",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 6,
      "title": "Better Life",
      "artist": "飞儿乐团",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 2,
      "title": "爱就要爆灯",
      "artist": "龙梅子",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 6,
      "title": "Better Life",
      "artist": "飞儿乐团",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 5,
      "title": "解放(私人定制片尾曲)",
      "artist": "羽泉",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 7,
      "title": "拯救(警察故事2013主题曲)",
      "artist": "成龙",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 7,
      "title": "拯救(警察故事2013主题曲)",
      "artist": "成龙",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 2,
      "title": "爱就要爆灯",
      "artist": "龙梅子",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 4,
      "title": "咪咕+U",
      "artist": "金志文,周子琰",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 6,
      "title": "Better Life",
      "artist": "飞儿乐团",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 7,
      "title": "拯救(警察故事2013主题曲)",
      "artist": "成龙",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 2,
      "title": "爱就要爆灯",
      "artist": "龙梅子",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 9,
      "title": "解放(私人定制片尾曲)",
      "artist": "羽泉",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 5,
      "title": "解放(私人定制片尾曲)",
      "artist": "羽泉",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    }
  ],
  "artists": [
    {
      "id": 8,
      "title": "咪咕+U",
      "artist": "金志文,周子琰",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 9,
      "title": "解放(私人定制片尾曲)",
      "artist": "羽泉",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 0,
      "title": "爸爸去哪儿（湖南卫视少儿励志节目）",
      "artist": "林志颖/Kimi/张亮/张悦轩/郭涛/郭子睿/王岳伦/王诗龄",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 4,
      "title": "咪咕+U",
      "artist": "金志文,周子琰",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 5,
      "title": "解放(私人定制片尾曲)",
      "artist": "羽泉",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 4,
      "title": "咪咕+U",
      "artist": "金志文,周子琰",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 1,
      "title": "他不懂",
      "artist": "张杰",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 6,
      "title": "Better Life",
      "artist": "飞儿乐团",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 3,
      "title": "想着你亲爱的",
      "artist": "祁隆",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 5,
      "title": "解放(私人定制片尾曲)",
      "artist": "羽泉",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 8,
      "title": "咪咕+U",
      "artist": "金志文,周子琰",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 7,
      "title": "拯救(警察故事2013主题曲)",
      "artist": "成龙",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 4,
      "title": "咪咕+U",
      "artist": "金志文,周子琰",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 9,
      "title": "解放(私人定制片尾曲)",
      "artist": "羽泉",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 3,
      "title": "想着你亲爱的",
      "artist": "祁隆",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 7,
      "title": "拯救(警察故事2013主题曲)",
      "artist": "成龙",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 7,
      "title": "拯救(警察故事2013主题曲)",
      "artist": "成龙",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 7,
      "title": "拯救(警察故事2013主题曲)",
      "artist": "成龙",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 1,
      "title": "他不懂",
      "artist": "张杰",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 7,
      "title": "拯救(警察故事2013主题曲)",
      "artist": "成龙",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 5,
      "title": "解放(私人定制片尾曲)",
      "artist": "羽泉",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 4,
      "title": "咪咕+U",
      "artist": "金志文,周子琰",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 9,
      "title": "解放(私人定制片尾曲)",
      "artist": "羽泉",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 1,
      "title": "他不懂",
      "artist": "张杰",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 1,
      "title": "他不懂",
      "artist": "张杰",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 1,
      "title": "他不懂",
      "artist": "张杰",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 2,
      "title": "爱就要爆灯",
      "artist": "龙梅子",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 9,
      "title": "解放(私人定制片尾曲)",
      "artist": "羽泉",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 2,
      "title": "爱就要爆灯",
      "artist": "龙梅子",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 1,
      "title": "他不懂",
      "artist": "张杰",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 6,
      "title": "Better Life",
      "artist": "飞儿乐团",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 3,
      "title": "想着你亲爱的",
      "artist": "祁隆",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 6,
      "title": "Better Life",
      "artist": "飞儿乐团",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 9,
      "title": "解放(私人定制片尾曲)",
      "artist": "羽泉",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 0,
      "title": "爸爸去哪儿（湖南卫视少儿励志节目）",
      "artist": "林志颖/Kimi/张亮/张悦轩/郭涛/郭子睿/王岳伦/王诗龄",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 9,
      "title": "解放(私人定制片尾曲)",
      "artist": "羽泉",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 6,
      "title": "Better Life",
      "artist": "飞儿乐团",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 2,
      "title": "爱就要爆灯",
      "artist": "龙梅子",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 7,
      "title": "拯救(警察故事2013主题曲)",
      "artist": "成龙",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 5,
      "title": "解放(私人定制片尾曲)",
      "artist": "羽泉",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 2,
      "title": "爱就要爆灯",
      "artist": "龙梅子",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 1,
      "title": "他不懂",
      "artist": "张杰",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 4,
      "title": "咪咕+U",
      "artist": "金志文,周子琰",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 5,
      "title": "解放(私人定制片尾曲)",
      "artist": "羽泉",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 7,
      "title": "拯救(警察故事2013主题曲)",
      "artist": "成龙",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 5,
      "title": "解放(私人定制片尾曲)",
      "artist": "羽泉",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 9,
      "title": "解放(私人定制片尾曲)",
      "artist": "羽泉",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 8,
      "title": "咪咕+U",
      "artist": "金志文,周子琰",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 3,
      "title": "想着你亲爱的",
      "artist": "祁隆",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 4,
      "title": "咪咕+U",
      "artist": "金志文,周子琰",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 3,
      "title": "想着你亲爱的",
      "artist": "祁隆",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 4,
      "title": "咪咕+U",
      "artist": "金志文,周子琰",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 0,
      "title": "爸爸去哪儿（湖南卫视少儿励志节目）",
      "artist": "林志颖/Kimi/张亮/张悦轩/郭涛/郭子睿/王岳伦/王诗龄",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 4,
      "title": "咪咕+U",
      "artist": "金志文,周子琰",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 2,
      "title": "爱就要爆灯",
      "artist": "龙梅子",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 9,
      "title": "解放(私人定制片尾曲)",
      "artist": "羽泉",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 7,
      "title": "拯救(警察故事2013主题曲)",
      "artist": "成龙",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 3,
      "title": "想着你亲爱的",
      "artist": "祁隆",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 1,
      "title": "他不懂",
      "artist": "张杰",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 5,
      "title": "解放(私人定制片尾曲)",
      "artist": "羽泉",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 6,
      "title": "Better Life",
      "artist": "飞儿乐团",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 2,
      "title": "爱就要爆灯",
      "artist": "龙梅子",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 5,
      "title": "解放(私人定制片尾曲)",
      "artist": "羽泉",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 2,
      "title": "爱就要爆灯",
      "artist": "龙梅子",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 0,
      "title": "爸爸去哪儿（湖南卫视少儿励志节目）",
      "artist": "林志颖/Kimi/张亮/张悦轩/郭涛/郭子睿/王岳伦/王诗龄",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 0,
      "title": "爸爸去哪儿（湖南卫视少儿励志节目）",
      "artist": "林志颖/Kimi/张亮/张悦轩/郭涛/郭子睿/王岳伦/王诗龄",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 2,
      "title": "爱就要爆灯",
      "artist": "龙梅子",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 0,
      "title": "爸爸去哪儿（湖南卫视少儿励志节目）",
      "artist": "林志颖/Kimi/张亮/张悦轩/郭涛/郭子睿/王岳伦/王诗龄",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 8,
      "title": "咪咕+U",
      "artist": "金志文,周子琰",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 0,
      "title": "爸爸去哪儿（湖南卫视少儿励志节目）",
      "artist": "林志颖/Kimi/张亮/张悦轩/郭涛/郭子睿/王岳伦/王诗龄",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 5,
      "title": "解放(私人定制片尾曲)",
      "artist": "羽泉",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 6,
      "title": "Better Life",
      "artist": "飞儿乐团",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 8,
      "title": "咪咕+U",
      "artist": "金志文,周子琰",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 2,
      "title": "爱就要爆灯",
      "artist": "龙梅子",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 8,
      "title": "咪咕+U",
      "artist": "金志文,周子琰",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 5,
      "title": "解放(私人定制片尾曲)",
      "artist": "羽泉",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 0,
      "title": "爸爸去哪儿（湖南卫视少儿励志节目）",
      "artist": "林志颖/Kimi/张亮/张悦轩/郭涛/郭子睿/王岳伦/王诗龄",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 8,
      "title": "咪咕+U",
      "artist": "金志文,周子琰",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 9,
      "title": "解放(私人定制片尾曲)",
      "artist": "羽泉",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 6,
      "title": "Better Life",
      "artist": "飞儿乐团",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 4,
      "title": "咪咕+U",
      "artist": "金志文,周子琰",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 0,
      "title": "爸爸去哪儿（湖南卫视少儿励志节目）",
      "artist": "林志颖/Kimi/张亮/张悦轩/郭涛/郭子睿/王岳伦/王诗龄",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 3,
      "title": "想着你亲爱的",
      "artist": "祁隆",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 3,
      "title": "想着你亲爱的",
      "artist": "祁隆",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 6,
      "title": "Better Life",
      "artist": "飞儿乐团",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 4,
      "title": "咪咕+U",
      "artist": "金志文,周子琰",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 8,
      "title": "咪咕+U",
      "artist": "金志文,周子琰",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 1,
      "title": "他不懂",
      "artist": "张杰",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 0,
      "title": "爸爸去哪儿（湖南卫视少儿励志节目）",
      "artist": "林志颖/Kimi/张亮/张悦轩/郭涛/郭子睿/王岳伦/王诗龄",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 7,
      "title": "拯救(警察故事2013主题曲)",
      "artist": "成龙",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 7,
      "title": "拯救(警察故事2013主题曲)",
      "artist": "成龙",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 8,
      "title": "咪咕+U",
      "artist": "金志文,周子琰",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 6,
      "title": "Better Life",
      "artist": "飞儿乐团",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 3,
      "title": "想着你亲爱的",
      "artist": "祁隆",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 6,
      "title": "Better Life",
      "artist": "飞儿乐团",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 8,
      "title": "咪咕+U",
      "artist": "金志文,周子琰",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 2,
      "title": "爱就要爆灯",
      "artist": "龙梅子",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 3,
      "title": "想着你亲爱的",
      "artist": "祁隆",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 9,
      "title": "解放(私人定制片尾曲)",
      "artist": "羽泉",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 1,
      "title": "他不懂",
      "artist": "张杰",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    }
  ],
  "albums": [
    {
      "id": 2,
      "title": "爱就要爆灯",
      "artist": "龙梅子",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 5,
      "title": "解放(私人定制片尾曲)",
      "artist": "羽泉",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 7,
      "title": "拯救(警察故事2013主题曲)",
      "artist": "成龙",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 5,
      "title": "解放(私人定制片尾曲)",
      "artist": "羽泉",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 5,
      "title": "解放(私人定制片尾曲)",
      "artist": "羽泉",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 6,
      "title": "Better Life",
      "artist": "飞儿乐团",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 9,
      "title": "解放(私人定制片尾曲)",
      "artist": "羽泉",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 0,
      "title": "爸爸去哪儿（湖南卫视少儿励志节目）",
      "artist": "林志颖/Kimi/张亮/张悦轩/郭涛/郭子睿/王岳伦/王诗龄",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 1,
      "title": "他不懂",
      "artist": "张杰",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 9,
      "title": "解放(私人定制片尾曲)",
      "artist": "羽泉",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 9,
      "title": "解放(私人定制片尾曲)",
      "artist": "羽泉",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 9,
      "title": "解放(私人定制片尾曲)",
      "artist": "羽泉",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 0,
      "title": "爸爸去哪儿（湖南卫视少儿励志节目）",
      "artist": "林志颖/Kimi/张亮/张悦轩/郭涛/郭子睿/王岳伦/王诗龄",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 1,
      "title": "他不懂",
      "artist": "张杰",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 2,
      "title": "爱就要爆灯",
      "artist": "龙梅子",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 2,
      "title": "爱就要爆灯",
      "artist": "龙梅子",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 0,
      "title": "爸爸去哪儿（湖南卫视少儿励志节目）",
      "artist": "林志颖/Kimi/张亮/张悦轩/郭涛/郭子睿/王岳伦/王诗龄",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 4,
      "title": "咪咕+U",
      "artist": "金志文,周子琰",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 9,
      "title": "解放(私人定制片尾曲)",
      "artist": "羽泉",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 0,
      "title": "爸爸去哪儿（湖南卫视少儿励志节目）",
      "artist": "林志颖/Kimi/张亮/张悦轩/郭涛/郭子睿/王岳伦/王诗龄",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 6,
      "title": "Better Life",
      "artist": "飞儿乐团",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 0,
      "title": "爸爸去哪儿（湖南卫视少儿励志节目）",
      "artist": "林志颖/Kimi/张亮/张悦轩/郭涛/郭子睿/王岳伦/王诗龄",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 5,
      "title": "解放(私人定制片尾曲)",
      "artist": "羽泉",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 1,
      "title": "他不懂",
      "artist": "张杰",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 3,
      "title": "想着你亲爱的",
      "artist": "祁隆",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 5,
      "title": "解放(私人定制片尾曲)",
      "artist": "羽泉",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 4,
      "title": "咪咕+U",
      "artist": "金志文,周子琰",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 1,
      "title": "他不懂",
      "artist": "张杰",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 1,
      "title": "他不懂",
      "artist": "张杰",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 5,
      "title": "解放(私人定制片尾曲)",
      "artist": "羽泉",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 3,
      "title": "想着你亲爱的",
      "artist": "祁隆",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 3,
      "title": "想着你亲爱的",
      "artist": "祁隆",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 7,
      "title": "拯救(警察故事2013主题曲)",
      "artist": "成龙",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 7,
      "title": "拯救(警察故事2013主题曲)",
      "artist": "成龙",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 3,
      "title": "想着你亲爱的",
      "artist": "祁隆",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 3,
      "title": "想着你亲爱的",
      "artist": "祁隆",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 2,
      "title": "爱就要爆灯",
      "artist": "龙梅子",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 0,
      "title": "爸爸去哪儿（湖南卫视少儿励志节目）",
      "artist": "林志颖/Kimi/张亮/张悦轩/郭涛/郭子睿/王岳伦/王诗龄",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 2,
      "title": "爱就要爆灯",
      "artist": "龙梅子",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 6,
      "title": "Better Life",
      "artist": "飞儿乐团",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 4,
      "title": "咪咕+U",
      "artist": "金志文,周子琰",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 0,
      "title": "爸爸去哪儿（湖南卫视少儿励志节目）",
      "artist": "林志颖/Kimi/张亮/张悦轩/郭涛/郭子睿/王岳伦/王诗龄",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 1,
      "title": "他不懂",
      "artist": "张杰",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 8,
      "title": "咪咕+U",
      "artist": "金志文,周子琰",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 2,
      "title": "爱就要爆灯",
      "artist": "龙梅子",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 9,
      "title": "解放(私人定制片尾曲)",
      "artist": "羽泉",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 9,
      "title": "解放(私人定制片尾曲)",
      "artist": "羽泉",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 6,
      "title": "Better Life",
      "artist": "飞儿乐团",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 4,
      "title": "咪咕+U",
      "artist": "金志文,周子琰",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 7,
      "title": "拯救(警察故事2013主题曲)",
      "artist": "成龙",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 6,
      "title": "Better Life",
      "artist": "飞儿乐团",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 4,
      "title": "咪咕+U",
      "artist": "金志文,周子琰",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 8,
      "title": "咪咕+U",
      "artist": "金志文,周子琰",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 5,
      "title": "解放(私人定制片尾曲)",
      "artist": "羽泉",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 6,
      "title": "Better Life",
      "artist": "飞儿乐团",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 8,
      "title": "咪咕+U",
      "artist": "金志文,周子琰",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 3,
      "title": "想着你亲爱的",
      "artist": "祁隆",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 2,
      "title": "爱就要爆灯",
      "artist": "龙梅子",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 1,
      "title": "他不懂",
      "artist": "张杰",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 7,
      "title": "拯救(警察故事2013主题曲)",
      "artist": "成龙",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 8,
      "title": "咪咕+U",
      "artist": "金志文,周子琰",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 7,
      "title": "拯救(警察故事2013主题曲)",
      "artist": "成龙",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 4,
      "title": "咪咕+U",
      "artist": "金志文,周子琰",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 9,
      "title": "解放(私人定制片尾曲)",
      "artist": "羽泉",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 4,
      "title": "咪咕+U",
      "artist": "金志文,周子琰",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 8,
      "title": "咪咕+U",
      "artist": "金志文,周子琰",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 4,
      "title": "咪咕+U",
      "artist": "金志文,周子琰",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 7,
      "title": "拯救(警察故事2013主题曲)",
      "artist": "成龙",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 0,
      "title": "爸爸去哪儿（湖南卫视少儿励志节目）",
      "artist": "林志颖/Kimi/张亮/张悦轩/郭涛/郭子睿/王岳伦/王诗龄",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 5,
      "title": "解放(私人定制片尾曲)",
      "artist": "羽泉",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 7,
      "title": "拯救(警察故事2013主题曲)",
      "artist": "成龙",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 3,
      "title": "想着你亲爱的",
      "artist": "祁隆",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 5,
      "title": "解放(私人定制片尾曲)",
      "artist": "羽泉",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 2,
      "title": "爱就要爆灯",
      "artist": "龙梅子",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 6,
      "title": "Better Life",
      "artist": "飞儿乐团",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 2,
      "title": "爱就要爆灯",
      "artist": "龙梅子",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 5,
      "title": "解放(私人定制片尾曲)",
      "artist": "羽泉",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 0,
      "title": "爸爸去哪儿（湖南卫视少儿励志节目）",
      "artist": "林志颖/Kimi/张亮/张悦轩/郭涛/郭子睿/王岳伦/王诗龄",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 6,
      "title": "Better Life",
      "artist": "飞儿乐团",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 7,
      "title": "拯救(警察故事2013主题曲)",
      "artist": "成龙",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 8,
      "title": "咪咕+U",
      "artist": "金志文,周子琰",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 3,
      "title": "想着你亲爱的",
      "artist": "祁隆",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 4,
      "title": "咪咕+U",
      "artist": "金志文,周子琰",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 8,
      "title": "咪咕+U",
      "artist": "金志文,周子琰",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 1,
      "title": "他不懂",
      "artist": "张杰",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 1,
      "title": "他不懂",
      "artist": "张杰",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 3,
      "title": "想着你亲爱的",
      "artist": "祁隆",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 3,
      "title": "想着你亲爱的",
      "artist": "祁隆",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 7,
      "title": "拯救(警察故事2013主题曲)",
      "artist": "成龙",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 8,
      "title": "咪咕+U",
      "artist": "金志文,周子琰",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 6,
      "title": "Better Life",
      "artist": "飞儿乐团",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 9,
      "title": "解放(私人定制片尾曲)",
      "artist": "羽泉",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 4,
      "title": "咪咕+U",
      "artist": "金志文,周子琰",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 6,
      "title": "Better Life",
      "artist": "飞儿乐团",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 2,
      "title": "爱就要爆灯",
      "artist": "龙梅子",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 8,
      "title": "咪咕+U",
      "artist": "金志文,周子琰",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 1,
      "title": "他不懂",
      "artist": "张杰",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 8,
      "title": "咪咕+U",
      "artist": "金志文,周子琰",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 0,
      "title": "爸爸去哪儿（湖南卫视少儿励志节目）",
      "artist": "林志颖/Kimi/张亮/张悦轩/郭涛/郭子睿/王岳伦/王诗龄",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 9,
      "title": "解放(私人定制片尾曲)",
      "artist": "羽泉",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    }
  ],
  "success": true
}
```




相关新闻接口
----------

GET api/xgxw.json



返回数据应包含以下字段：

``` 
xgxw: 相关新闻信息，包含 4 条 新闻信息 
totalPage: 总页数信息，包含 10 条 信息 
```



例如：

```json
{
  "xgxw": [
    {
      "id": 0,
      "title": "[咪咕杂志]2014星凯国际城星光璀璨",
      "subtitle": "激情点燃梦想！以动感炫酷的激光秀开启全场",
      "image": "samples/news.jpg"
    },
    {
      "id": 5,
      "title": "陈奕迅否认与经纪人闹翻 称会继续领奖",
      "subtitle": "北京时间1月6日消息，据香港媒体报导，陈奕迅[微博]日前出席《叱咤颁奖礼》被指黑面及状态欠佳",
      "image": "samples/news.jpg"
    },
    {
      "id": 2,
      "title": "古惑仔五子赴台尝美食 无拍电影续集打算",
      "subtitle": "1月5日台北，港星郑伊健[微博]、陈小春[微博]、谢天华[微博]、钱嘉乐[微博]及林晓峰",
      "image": "samples/news.jpg"
    },
    {
      "id": 4,
      "title": "苏醒自组工作室称一哥 曾打李炜遭雪藏",
      "subtitle": "新浪娱乐讯 前段时间苏醒[微博]因为殴打事件而被天娱公司雪藏200天，直到2013年12月30日苏醒才通过微博透露已被解冻出",
      "image": "samples/news.jpg"
    }
  ],
  "totalPage": 10,
  "success": true
}
```




活动详情接口
----------

GET api/hd/hd_id.json



返回数据应包含以下字段：

``` 
hd: 活动信息，包含 1 条 活动详情信息 
tjqm: 推荐曲目信息，包含 10 条 音乐信息 
```



例如：

```json
{
  "hd": {
    "id": 4,
    "title": "10月20日S.H.E天津演唱会抢票",
    "time": "2013-10-20",
    "location": "天津体育中心",
    "image": "samples/activity5.jpg",
    "cover": "samples/cover.jpg",
    "content": "我的隔壁是不是住着某个可爱的外星人呢？能否和他创造出奇迹般的甜蜜浪漫呢？\n400年前坠落在朝鲜的外星人，带着他迄今为止4个世纪的秘密，独自在韩国首尔的天空下生活着。"
  },
  "tjqm": [
    {
      "id": 9,
      "title": "解放(私人定制片尾曲)",
      "artist": "羽泉",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 9,
      "title": "解放(私人定制片尾曲)",
      "artist": "羽泉",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 6,
      "title": "Better Life",
      "artist": "飞儿乐团",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 5,
      "title": "解放(私人定制片尾曲)",
      "artist": "羽泉",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 7,
      "title": "拯救(警察故事2013主题曲)",
      "artist": "成龙",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 1,
      "title": "他不懂",
      "artist": "张杰",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 1,
      "title": "他不懂",
      "artist": "张杰",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 2,
      "title": "爱就要爆灯",
      "artist": "龙梅子",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 7,
      "title": "拯救(警察故事2013主题曲)",
      "artist": "成龙",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 2,
      "title": "爱就要爆灯",
      "artist": "龙梅子",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    }
  ],
  "success": true
}
```




专辑接口
----------

GET api/album.json



返回数据应包含以下字段：

``` 
image: 信息，包含 http://img01.12530.com/music/picture/20130708/6/7/oCDD7lrY.jpg 条 信息 
title: 信息，包含 十二新作 条 信息 
content: 信息，包含 <p>歌手：周杰伦 </p><p>语言：国语</p><p>发行时间：2012-12-28 </p><p>唱片公司：杰威尔音乐</p> 条 信息 
description: 信息，包含 周杰伦的12，代表的也是一种圆满与完全，出道第12年的第十二个月，推出一年一张的新专辑，代表着对音乐的圆满成就，也代表音乐界另一个新的大循环的预告。 条 信息 
musics: 音乐信息，包含 100 条 音乐信息 
```



例如：

```json
{
  "image": "http://img01.12530.com/music/picture/20130708/6/7/oCDD7lrY.jpg",
  "title": "十二新作",
  "content": "<p>歌手：周杰伦 </p><p>语言：国语</p><p>发行时间：2012-12-28 </p><p>唱片公司：杰威尔音乐</p>",
  "description": "周杰伦的12，代表的也是一种圆满与完全，出道第12年的第十二个月，推出一年一张的新专辑，代表着对音乐的圆满成就，也代表音乐界另一个新的大循环的预告。",
  "musics": [
    {
      "id": 9,
      "title": "解放(私人定制片尾曲)",
      "artist": "羽泉",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 1,
      "title": "他不懂",
      "artist": "张杰",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 5,
      "title": "解放(私人定制片尾曲)",
      "artist": "羽泉",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 5,
      "title": "解放(私人定制片尾曲)",
      "artist": "羽泉",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 7,
      "title": "拯救(警察故事2013主题曲)",
      "artist": "成龙",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 0,
      "title": "爸爸去哪儿（湖南卫视少儿励志节目）",
      "artist": "林志颖/Kimi/张亮/张悦轩/郭涛/郭子睿/王岳伦/王诗龄",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 4,
      "title": "咪咕+U",
      "artist": "金志文,周子琰",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 2,
      "title": "爱就要爆灯",
      "artist": "龙梅子",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 7,
      "title": "拯救(警察故事2013主题曲)",
      "artist": "成龙",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 8,
      "title": "咪咕+U",
      "artist": "金志文,周子琰",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 9,
      "title": "解放(私人定制片尾曲)",
      "artist": "羽泉",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 5,
      "title": "解放(私人定制片尾曲)",
      "artist": "羽泉",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 7,
      "title": "拯救(警察故事2013主题曲)",
      "artist": "成龙",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 6,
      "title": "Better Life",
      "artist": "飞儿乐团",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 0,
      "title": "爸爸去哪儿（湖南卫视少儿励志节目）",
      "artist": "林志颖/Kimi/张亮/张悦轩/郭涛/郭子睿/王岳伦/王诗龄",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 1,
      "title": "他不懂",
      "artist": "张杰",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 1,
      "title": "他不懂",
      "artist": "张杰",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 5,
      "title": "解放(私人定制片尾曲)",
      "artist": "羽泉",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 8,
      "title": "咪咕+U",
      "artist": "金志文,周子琰",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 8,
      "title": "咪咕+U",
      "artist": "金志文,周子琰",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 9,
      "title": "解放(私人定制片尾曲)",
      "artist": "羽泉",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 7,
      "title": "拯救(警察故事2013主题曲)",
      "artist": "成龙",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 2,
      "title": "爱就要爆灯",
      "artist": "龙梅子",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 0,
      "title": "爸爸去哪儿（湖南卫视少儿励志节目）",
      "artist": "林志颖/Kimi/张亮/张悦轩/郭涛/郭子睿/王岳伦/王诗龄",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 9,
      "title": "解放(私人定制片尾曲)",
      "artist": "羽泉",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 8,
      "title": "咪咕+U",
      "artist": "金志文,周子琰",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 4,
      "title": "咪咕+U",
      "artist": "金志文,周子琰",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 3,
      "title": "想着你亲爱的",
      "artist": "祁隆",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 8,
      "title": "咪咕+U",
      "artist": "金志文,周子琰",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 0,
      "title": "爸爸去哪儿（湖南卫视少儿励志节目）",
      "artist": "林志颖/Kimi/张亮/张悦轩/郭涛/郭子睿/王岳伦/王诗龄",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 6,
      "title": "Better Life",
      "artist": "飞儿乐团",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 5,
      "title": "解放(私人定制片尾曲)",
      "artist": "羽泉",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 2,
      "title": "爱就要爆灯",
      "artist": "龙梅子",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 1,
      "title": "他不懂",
      "artist": "张杰",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 2,
      "title": "爱就要爆灯",
      "artist": "龙梅子",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 8,
      "title": "咪咕+U",
      "artist": "金志文,周子琰",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 1,
      "title": "他不懂",
      "artist": "张杰",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 9,
      "title": "解放(私人定制片尾曲)",
      "artist": "羽泉",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 5,
      "title": "解放(私人定制片尾曲)",
      "artist": "羽泉",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 0,
      "title": "爸爸去哪儿（湖南卫视少儿励志节目）",
      "artist": "林志颖/Kimi/张亮/张悦轩/郭涛/郭子睿/王岳伦/王诗龄",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 8,
      "title": "咪咕+U",
      "artist": "金志文,周子琰",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 6,
      "title": "Better Life",
      "artist": "飞儿乐团",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 4,
      "title": "咪咕+U",
      "artist": "金志文,周子琰",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 3,
      "title": "想着你亲爱的",
      "artist": "祁隆",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 3,
      "title": "想着你亲爱的",
      "artist": "祁隆",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 5,
      "title": "解放(私人定制片尾曲)",
      "artist": "羽泉",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 6,
      "title": "Better Life",
      "artist": "飞儿乐团",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 7,
      "title": "拯救(警察故事2013主题曲)",
      "artist": "成龙",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 3,
      "title": "想着你亲爱的",
      "artist": "祁隆",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 2,
      "title": "爱就要爆灯",
      "artist": "龙梅子",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 9,
      "title": "解放(私人定制片尾曲)",
      "artist": "羽泉",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 9,
      "title": "解放(私人定制片尾曲)",
      "artist": "羽泉",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 2,
      "title": "爱就要爆灯",
      "artist": "龙梅子",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 9,
      "title": "解放(私人定制片尾曲)",
      "artist": "羽泉",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 0,
      "title": "爸爸去哪儿（湖南卫视少儿励志节目）",
      "artist": "林志颖/Kimi/张亮/张悦轩/郭涛/郭子睿/王岳伦/王诗龄",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 5,
      "title": "解放(私人定制片尾曲)",
      "artist": "羽泉",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 0,
      "title": "爸爸去哪儿（湖南卫视少儿励志节目）",
      "artist": "林志颖/Kimi/张亮/张悦轩/郭涛/郭子睿/王岳伦/王诗龄",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 0,
      "title": "爸爸去哪儿（湖南卫视少儿励志节目）",
      "artist": "林志颖/Kimi/张亮/张悦轩/郭涛/郭子睿/王岳伦/王诗龄",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 9,
      "title": "解放(私人定制片尾曲)",
      "artist": "羽泉",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 2,
      "title": "爱就要爆灯",
      "artist": "龙梅子",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 6,
      "title": "Better Life",
      "artist": "飞儿乐团",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 2,
      "title": "爱就要爆灯",
      "artist": "龙梅子",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 4,
      "title": "咪咕+U",
      "artist": "金志文,周子琰",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 2,
      "title": "爱就要爆灯",
      "artist": "龙梅子",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 3,
      "title": "想着你亲爱的",
      "artist": "祁隆",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 8,
      "title": "咪咕+U",
      "artist": "金志文,周子琰",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 6,
      "title": "Better Life",
      "artist": "飞儿乐团",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 4,
      "title": "咪咕+U",
      "artist": "金志文,周子琰",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 3,
      "title": "想着你亲爱的",
      "artist": "祁隆",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 4,
      "title": "咪咕+U",
      "artist": "金志文,周子琰",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 4,
      "title": "咪咕+U",
      "artist": "金志文,周子琰",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 4,
      "title": "咪咕+U",
      "artist": "金志文,周子琰",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 1,
      "title": "他不懂",
      "artist": "张杰",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 6,
      "title": "Better Life",
      "artist": "飞儿乐团",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 6,
      "title": "Better Life",
      "artist": "飞儿乐团",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 3,
      "title": "想着你亲爱的",
      "artist": "祁隆",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 4,
      "title": "咪咕+U",
      "artist": "金志文,周子琰",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 4,
      "title": "咪咕+U",
      "artist": "金志文,周子琰",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 3,
      "title": "想着你亲爱的",
      "artist": "祁隆",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 1,
      "title": "他不懂",
      "artist": "张杰",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 3,
      "title": "想着你亲爱的",
      "artist": "祁隆",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 7,
      "title": "拯救(警察故事2013主题曲)",
      "artist": "成龙",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 7,
      "title": "拯救(警察故事2013主题曲)",
      "artist": "成龙",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 6,
      "title": "Better Life",
      "artist": "飞儿乐团",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 1,
      "title": "他不懂",
      "artist": "张杰",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 8,
      "title": "咪咕+U",
      "artist": "金志文,周子琰",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 2,
      "title": "爱就要爆灯",
      "artist": "龙梅子",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 9,
      "title": "解放(私人定制片尾曲)",
      "artist": "羽泉",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 7,
      "title": "拯救(警察故事2013主题曲)",
      "artist": "成龙",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 0,
      "title": "爸爸去哪儿（湖南卫视少儿励志节目）",
      "artist": "林志颖/Kimi/张亮/张悦轩/郭涛/郭子睿/王岳伦/王诗龄",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 7,
      "title": "拯救(警察故事2013主题曲)",
      "artist": "成龙",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 8,
      "title": "咪咕+U",
      "artist": "金志文,周子琰",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 0,
      "title": "爸爸去哪儿（湖南卫视少儿励志节目）",
      "artist": "林志颖/Kimi/张亮/张悦轩/郭涛/郭子睿/王岳伦/王诗龄",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 1,
      "title": "他不懂",
      "artist": "张杰",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 3,
      "title": "想着你亲爱的",
      "artist": "祁隆",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 5,
      "title": "解放(私人定制片尾曲)",
      "artist": "羽泉",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 5,
      "title": "解放(私人定制片尾曲)",
      "artist": "羽泉",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 1,
      "title": "他不懂",
      "artist": "张杰",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 7,
      "title": "拯救(警察故事2013主题曲)",
      "artist": "成龙",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 6,
      "title": "Better Life",
      "artist": "飞儿乐团",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    }
  ],
  "success": true
}
```




歌手接口
----------

GET api/artist.json



返回数据应包含以下字段：

``` 
image: 信息，包含 http://img01.12530.com/music/picture/20130708/6/7/oCDD7lrY.jpg 条 信息 
title: 信息，包含 周杰伦 条 信息 
content: 信息，包含 <p>歌手：周杰伦 </p><p>语言：国语</p><p>发行时间：2012-12-28 </p><p>唱片公司：杰威尔音乐</p> 条 信息 
musics: 音乐信息，包含 100 条 音乐信息 
```



例如：

```json
{
  "image": "http://img01.12530.com/music/picture/20130708/6/7/oCDD7lrY.jpg",
  "title": "周杰伦",
  "content": "<p>歌手：周杰伦 </p><p>语言：国语</p><p>发行时间：2012-12-28 </p><p>唱片公司：杰威尔音乐</p>",
  "musics": [
    {
      "id": 1,
      "title": "他不懂",
      "artist": "张杰",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 2,
      "title": "爱就要爆灯",
      "artist": "龙梅子",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 0,
      "title": "爸爸去哪儿（湖南卫视少儿励志节目）",
      "artist": "林志颖/Kimi/张亮/张悦轩/郭涛/郭子睿/王岳伦/王诗龄",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 3,
      "title": "想着你亲爱的",
      "artist": "祁隆",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 1,
      "title": "他不懂",
      "artist": "张杰",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 7,
      "title": "拯救(警察故事2013主题曲)",
      "artist": "成龙",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 5,
      "title": "解放(私人定制片尾曲)",
      "artist": "羽泉",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 6,
      "title": "Better Life",
      "artist": "飞儿乐团",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 5,
      "title": "解放(私人定制片尾曲)",
      "artist": "羽泉",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 8,
      "title": "咪咕+U",
      "artist": "金志文,周子琰",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 8,
      "title": "咪咕+U",
      "artist": "金志文,周子琰",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 7,
      "title": "拯救(警察故事2013主题曲)",
      "artist": "成龙",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 7,
      "title": "拯救(警察故事2013主题曲)",
      "artist": "成龙",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 8,
      "title": "咪咕+U",
      "artist": "金志文,周子琰",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 3,
      "title": "想着你亲爱的",
      "artist": "祁隆",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 0,
      "title": "爸爸去哪儿（湖南卫视少儿励志节目）",
      "artist": "林志颖/Kimi/张亮/张悦轩/郭涛/郭子睿/王岳伦/王诗龄",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 5,
      "title": "解放(私人定制片尾曲)",
      "artist": "羽泉",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 7,
      "title": "拯救(警察故事2013主题曲)",
      "artist": "成龙",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 4,
      "title": "咪咕+U",
      "artist": "金志文,周子琰",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 9,
      "title": "解放(私人定制片尾曲)",
      "artist": "羽泉",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 2,
      "title": "爱就要爆灯",
      "artist": "龙梅子",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 2,
      "title": "爱就要爆灯",
      "artist": "龙梅子",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 5,
      "title": "解放(私人定制片尾曲)",
      "artist": "羽泉",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 3,
      "title": "想着你亲爱的",
      "artist": "祁隆",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 0,
      "title": "爸爸去哪儿（湖南卫视少儿励志节目）",
      "artist": "林志颖/Kimi/张亮/张悦轩/郭涛/郭子睿/王岳伦/王诗龄",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 6,
      "title": "Better Life",
      "artist": "飞儿乐团",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 9,
      "title": "解放(私人定制片尾曲)",
      "artist": "羽泉",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 9,
      "title": "解放(私人定制片尾曲)",
      "artist": "羽泉",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 4,
      "title": "咪咕+U",
      "artist": "金志文,周子琰",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 5,
      "title": "解放(私人定制片尾曲)",
      "artist": "羽泉",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 0,
      "title": "爸爸去哪儿（湖南卫视少儿励志节目）",
      "artist": "林志颖/Kimi/张亮/张悦轩/郭涛/郭子睿/王岳伦/王诗龄",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 7,
      "title": "拯救(警察故事2013主题曲)",
      "artist": "成龙",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 9,
      "title": "解放(私人定制片尾曲)",
      "artist": "羽泉",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 6,
      "title": "Better Life",
      "artist": "飞儿乐团",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 3,
      "title": "想着你亲爱的",
      "artist": "祁隆",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 6,
      "title": "Better Life",
      "artist": "飞儿乐团",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 4,
      "title": "咪咕+U",
      "artist": "金志文,周子琰",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 7,
      "title": "拯救(警察故事2013主题曲)",
      "artist": "成龙",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 8,
      "title": "咪咕+U",
      "artist": "金志文,周子琰",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 9,
      "title": "解放(私人定制片尾曲)",
      "artist": "羽泉",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 1,
      "title": "他不懂",
      "artist": "张杰",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 8,
      "title": "咪咕+U",
      "artist": "金志文,周子琰",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 0,
      "title": "爸爸去哪儿（湖南卫视少儿励志节目）",
      "artist": "林志颖/Kimi/张亮/张悦轩/郭涛/郭子睿/王岳伦/王诗龄",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 0,
      "title": "爸爸去哪儿（湖南卫视少儿励志节目）",
      "artist": "林志颖/Kimi/张亮/张悦轩/郭涛/郭子睿/王岳伦/王诗龄",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 9,
      "title": "解放(私人定制片尾曲)",
      "artist": "羽泉",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 3,
      "title": "想着你亲爱的",
      "artist": "祁隆",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 9,
      "title": "解放(私人定制片尾曲)",
      "artist": "羽泉",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 6,
      "title": "Better Life",
      "artist": "飞儿乐团",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 1,
      "title": "他不懂",
      "artist": "张杰",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 6,
      "title": "Better Life",
      "artist": "飞儿乐团",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 1,
      "title": "他不懂",
      "artist": "张杰",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 2,
      "title": "爱就要爆灯",
      "artist": "龙梅子",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 9,
      "title": "解放(私人定制片尾曲)",
      "artist": "羽泉",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 7,
      "title": "拯救(警察故事2013主题曲)",
      "artist": "成龙",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 7,
      "title": "拯救(警察故事2013主题曲)",
      "artist": "成龙",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 1,
      "title": "他不懂",
      "artist": "张杰",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 8,
      "title": "咪咕+U",
      "artist": "金志文,周子琰",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 0,
      "title": "爸爸去哪儿（湖南卫视少儿励志节目）",
      "artist": "林志颖/Kimi/张亮/张悦轩/郭涛/郭子睿/王岳伦/王诗龄",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 5,
      "title": "解放(私人定制片尾曲)",
      "artist": "羽泉",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 9,
      "title": "解放(私人定制片尾曲)",
      "artist": "羽泉",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 7,
      "title": "拯救(警察故事2013主题曲)",
      "artist": "成龙",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 1,
      "title": "他不懂",
      "artist": "张杰",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 5,
      "title": "解放(私人定制片尾曲)",
      "artist": "羽泉",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 4,
      "title": "咪咕+U",
      "artist": "金志文,周子琰",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 1,
      "title": "他不懂",
      "artist": "张杰",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 4,
      "title": "咪咕+U",
      "artist": "金志文,周子琰",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 9,
      "title": "解放(私人定制片尾曲)",
      "artist": "羽泉",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 2,
      "title": "爱就要爆灯",
      "artist": "龙梅子",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 5,
      "title": "解放(私人定制片尾曲)",
      "artist": "羽泉",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 0,
      "title": "爸爸去哪儿（湖南卫视少儿励志节目）",
      "artist": "林志颖/Kimi/张亮/张悦轩/郭涛/郭子睿/王岳伦/王诗龄",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 2,
      "title": "爱就要爆灯",
      "artist": "龙梅子",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 2,
      "title": "爱就要爆灯",
      "artist": "龙梅子",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 6,
      "title": "Better Life",
      "artist": "飞儿乐团",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 0,
      "title": "爸爸去哪儿（湖南卫视少儿励志节目）",
      "artist": "林志颖/Kimi/张亮/张悦轩/郭涛/郭子睿/王岳伦/王诗龄",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 4,
      "title": "咪咕+U",
      "artist": "金志文,周子琰",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 4,
      "title": "咪咕+U",
      "artist": "金志文,周子琰",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 0,
      "title": "爸爸去哪儿（湖南卫视少儿励志节目）",
      "artist": "林志颖/Kimi/张亮/张悦轩/郭涛/郭子睿/王岳伦/王诗龄",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 3,
      "title": "想着你亲爱的",
      "artist": "祁隆",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 8,
      "title": "咪咕+U",
      "artist": "金志文,周子琰",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 8,
      "title": "咪咕+U",
      "artist": "金志文,周子琰",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 6,
      "title": "Better Life",
      "artist": "飞儿乐团",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 4,
      "title": "咪咕+U",
      "artist": "金志文,周子琰",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 5,
      "title": "解放(私人定制片尾曲)",
      "artist": "羽泉",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 1,
      "title": "他不懂",
      "artist": "张杰",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 4,
      "title": "咪咕+U",
      "artist": "金志文,周子琰",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 4,
      "title": "咪咕+U",
      "artist": "金志文,周子琰",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 1,
      "title": "他不懂",
      "artist": "张杰",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 2,
      "title": "爱就要爆灯",
      "artist": "龙梅子",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 2,
      "title": "爱就要爆灯",
      "artist": "龙梅子",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 6,
      "title": "Better Life",
      "artist": "飞儿乐团",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 6,
      "title": "Better Life",
      "artist": "飞儿乐团",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 2,
      "title": "爱就要爆灯",
      "artist": "龙梅子",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 8,
      "title": "咪咕+U",
      "artist": "金志文,周子琰",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 3,
      "title": "想着你亲爱的",
      "artist": "祁隆",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 3,
      "title": "想着你亲爱的",
      "artist": "祁隆",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 7,
      "title": "拯救(警察故事2013主题曲)",
      "artist": "成龙",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 5,
      "title": "解放(私人定制片尾曲)",
      "artist": "羽泉",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 3,
      "title": "想着你亲爱的",
      "artist": "祁隆",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 8,
      "title": "咪咕+U",
      "artist": "金志文,周子琰",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 3,
      "title": "想着你亲爱的",
      "artist": "祁隆",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    }
  ],
  "success": true
}
```




接口
----------

GET api/free.json



返回数据应包含以下字段：

``` 
list1: 信息，包含 8 条 音乐信息 
list2: 信息，包含 8 条 音乐信息 
list1Title: 信息，包含 最新 条 信息 
list2Title: 信息，包含 最热 条 信息 
```



例如：

```json
{
  "list1": [
    {
      "id": 8,
      "title": "咪咕+U",
      "artist": "金志文,周子琰",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 5,
      "title": "解放(私人定制片尾曲)",
      "artist": "羽泉",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 4,
      "title": "咪咕+U",
      "artist": "金志文,周子琰",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 0,
      "title": "爸爸去哪儿（湖南卫视少儿励志节目）",
      "artist": "林志颖/Kimi/张亮/张悦轩/郭涛/郭子睿/王岳伦/王诗龄",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 3,
      "title": "想着你亲爱的",
      "artist": "祁隆",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 3,
      "title": "想着你亲爱的",
      "artist": "祁隆",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 2,
      "title": "爱就要爆灯",
      "artist": "龙梅子",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 8,
      "title": "咪咕+U",
      "artist": "金志文,周子琰",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    }
  ],
  "list2": [
    {
      "id": 9,
      "title": "解放(私人定制片尾曲)",
      "artist": "羽泉",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 9,
      "title": "解放(私人定制片尾曲)",
      "artist": "羽泉",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 1,
      "title": "他不懂",
      "artist": "张杰",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 3,
      "title": "想着你亲爱的",
      "artist": "祁隆",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 9,
      "title": "解放(私人定制片尾曲)",
      "artist": "羽泉",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 0,
      "title": "爸爸去哪儿（湖南卫视少儿励志节目）",
      "artist": "林志颖/Kimi/张亮/张悦轩/郭涛/郭子睿/王岳伦/王诗龄",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 9,
      "title": "解放(私人定制片尾曲)",
      "artist": "羽泉",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 2,
      "title": "爱就要爆灯",
      "artist": "龙梅子",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    }
  ],
  "list1Title": "最新",
  "list2Title": "最热",
  "success": true
}
```




往期回顾接口
----------

GET api/wqhg.json



返回数据应包含以下字段：

``` 
wqhg: 往期回顾信息，包含 8 条 音乐信息 
totalPage: 总页数信息，包含 10 条 信息 
```



例如：

```json
{
  "wqhg": [
    {
      "id": 9,
      "title": "解放(私人定制片尾曲)",
      "artist": "羽泉",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 7,
      "title": "拯救(警察故事2013主题曲)",
      "artist": "成龙",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 8,
      "title": "咪咕+U",
      "artist": "金志文,周子琰",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 7,
      "title": "拯救(警察故事2013主题曲)",
      "artist": "成龙",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 4,
      "title": "咪咕+U",
      "artist": "金志文,周子琰",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 6,
      "title": "Better Life",
      "artist": "飞儿乐团",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 8,
      "title": "咪咕+U",
      "artist": "金志文,周子琰",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 2,
      "title": "爱就要爆灯",
      "artist": "龙梅子",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    }
  ],
  "totalPage": 10,
  "success": true
}
```




人气原创排行接口
----------

GET api/rqycph.json



返回数据应包含以下字段：

``` 
rqycph: 人气原创排行信息，包含 8 条 音乐信息 
totalPage: 总页数信息，包含 10 条 信息 
```



例如：

```json
{
  "rqycph": [
    {
      "id": 1,
      "title": "他不懂",
      "artist": "张杰",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 0,
      "title": "爸爸去哪儿（湖南卫视少儿励志节目）",
      "artist": "林志颖/Kimi/张亮/张悦轩/郭涛/郭子睿/王岳伦/王诗龄",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 1,
      "title": "他不懂",
      "artist": "张杰",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 2,
      "title": "爱就要爆灯",
      "artist": "龙梅子",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 3,
      "title": "想着你亲爱的",
      "artist": "祁隆",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 8,
      "title": "咪咕+U",
      "artist": "金志文,周子琰",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 5,
      "title": "解放(私人定制片尾曲)",
      "artist": "羽泉",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 2,
      "title": "爱就要爆灯",
      "artist": "龙梅子",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    }
  ],
  "totalPage": 10,
  "success": true
}
```




推荐音乐人接口
----------

GET api/tjyyr.json



返回数据应包含以下字段：

``` 
tjyyr: 推荐音乐人信息，包含 8 条 音乐信息 
totalPage: 总页数信息，包含 10 条 信息 
```



例如：

```json
{
  "tjyyr": [
    {
      "id": 3,
      "title": "想着你亲爱的",
      "artist": "祁隆",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 9,
      "title": "解放(私人定制片尾曲)",
      "artist": "羽泉",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 6,
      "title": "Better Life",
      "artist": "飞儿乐团",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 9,
      "title": "解放(私人定制片尾曲)",
      "artist": "羽泉",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 5,
      "title": "解放(私人定制片尾曲)",
      "artist": "羽泉",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 4,
      "title": "咪咕+U",
      "artist": "金志文,周子琰",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 9,
      "title": "解放(私人定制片尾曲)",
      "artist": "羽泉",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    },
    {
      "id": 7,
      "title": "拯救(警察故事2013主题曲)",
      "artist": "成龙",
      "mp3": "samples/media.mp3",
      "cover": "samples/cover.jpg",
      "lyrics": "samples/media.lrc"
    }
  ],
  "totalPage": 10,
  "success": true
}
```





搜索自动补全接口
----------

GET api/autocomplete.json

请求包括参数query，即：api/autocomplete.json?query=搜索关键字

返回数据应包含以下字段：

``` 
musics: 音乐补全信息，包含 多 条音乐标题字符串
artists: 歌手补全信息，包含 多 条歌手名字符串
albums: 专辑补全信息，包含 多 条专辑名字符串
```

例如：

```json
{
  "musics": [
    "他不懂",
    "天下"
  ],
  "artists": [
    "张杰",
    "张学友"
  ],
  "albums": [
    "解放（死人定制片尾曲）",
    "依然范特西"
  ]
}
```
