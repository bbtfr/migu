项目目录结构
----------

    bin/                    可执行文件（脚本）
      flavor.rb             Github Flavored Markdown HTML生成脚本
      json_gerenator.rb     JSON API示例生成脚本
      markdown_generator.rb Markdown文档生成脚本（使用flavor.rb）
    build/                  输出目录，与source目录结构相同，coffee输出为js，scss输出为css
    document/               文档目录
    source/                 源文件目录
      api/                  JSON API示例
      images/               图片
      javascripts/          JS脚本
        libs/               JS引用库
        utils/              自定义工具类
        routers/            Backbone Routers
        models/             Backbone Models
        collections/        Backbone Collections
        views/              Backbone Views
        templates/          Underscore模板
        app.coffee          Backbone App模块，Web App入口
      layouts/              ERB Layout
      samples/              开发用临时图片、音乐、歌词等资源
      stylesheets/          CSS样式
        all.scss            自定义CSS，包含CSS打包参数，所有CSS会打包进这个文件
        base.scss           设计提供
      *.html.erb            ERB模板
    config.rb               Middleman配置文件


项目使用[middleman](http://middlemanapp.com/)进行开发管理，ruby（middleman）开发环境

JS使用CoffeeScript编写，使用Compass管理打包模块，Backbone + Zepto进行开发

CSS使用SCSS编写

开发环境搭建
----------
Ruby环境和Nodejs环境

    brew install ruby
    brew install nodejs

middleman环境

    cd path/to/migu
    gem install bundle
    bundle install

开发模式启动项目
    
    cd path/to/migu
    middleman

构建项目
----------
    
    cd path/to/migu
    middleman build

构建项目参数可以在[config.rb](http://middlemanapp.com/advanced/configuration/)进行调整，详见该文件备注`configure :build`这一节
