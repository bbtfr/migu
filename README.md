*本文使用Markdown编写，源文件README.md，输出文件document/README.html*

项目目录结构
----------

    bin/                    可执行文件（脚本）
      flavor.rb             Github Flavored Markdown HTML生成脚本
      json_gerenator.rb     JSON API示例生成脚本
      markdown_generator.rb Markdown文档生成脚本（使用flavor.rb）
      r.js                  RequireJS打包脚本
    build/                  输出目录，与source目录结构相同，coffee输出为js，scss输出为css
    document/               文档目录
    source/                 源文件目录
      api/                  JSON API示例
      images/               图片
      javascripts/          JS脚本
        collections/        Backbone Collections
        lib/                JS引用库
        models/             Backbone Models
        utils/              自定义工具类
        views/              Backbone Views
        app.build.json      r.js打包参数，所有JS会打包进app.build.js文件
        app.coffee          Backbone App模块，Web App入口
        router.coffee       Backbone Router
      layouts/              ERB Layout
      samples/              开发用临时图片、音乐、歌词等资源
      stylesheets/          CSS样式
        all.scss            自定义CSS，包含CSS打包参数，所有CSS会打包进这个文件
        base.scss           设计提供
        jquerymobile.scss   JQuery Mobile CSS（有大量改动以兼容设计）
      templates/            Underscore模板
      *.html.erb            ERB模板
    config.rb               Middleman配置文件


项目使用[middleman](http://middlemanapp.com/)进行开发管理，打包需要安装nodejs（用于r.js打包）和ruby（middleman）开发环境

JS使用CoffeeScript编写，使用RequireJS管理打包模块，Backbone + JQuery Mobile进行开发

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
