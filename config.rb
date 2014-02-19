###
# Compass
###

# Change Compass configuration
# compass_config do |config|
#   config.output_style = :compact
# end

###
# Page options, layouts, aliases and proxies
###

# Per-page layout changes:
#
# With no layout
# page "/path/to/file.html", :layout => false
#
# With alternative layout
# page "/path/to/file.html", :layout => :otherlayout
#
# A path which all have the same layout
# with_layout :admin do
#   page "/admin/*"
# end
page "/templates/*", :layout => :template


# Proxy pages (http://middlemanapp.com/dynamic-pages/)
# proxy "/this-page-has-no-template.html", "/template-file.html", :locals => {
#  :which_fake_page => "Rendering a fake page with a local variable" }

###
# Helpers
###

# Automatic image dimensions on image_tag helper
# activate :automatic_image_sizes

# Reload the browser automatically whenever files change
# activate :livereload

# Methods defined in the helpers block are available in templates
# helpers do
#   def some_helper
#     "Helping"
#   end
# end

set :css_dir, 'stylesheets'

set :js_dir, 'javascripts'

set :images_dir, 'images'

# Build-specific configuration
# 启用参数取消注释即可
configure :build do
  # For example, change the Compass output style for deployment
  # 压缩CSS
  activate :minify_css

  # Minify Javascript on build
  # 压缩JS
  # activate :minify_javascript

  # Enable cache buster
  # 启用Asset Hash（清除浏览器Cache）
  # activate :asset_hash

  # Use relative URLs
  # Assets使用相对路径
  activate :relative_assets

  # Or use a different image path
  # 使用绝对路径前缀
  # set :http_prefix, "/Content/images/"

  # 启用r.js打包，将所有JS打包为一个文件
  # 这个插件是我自己编写的，可能使用过程中会有问题，之后再做调整
  activate :requirejs
end

module RequireJS
  class << self
    def registered(app)
      app.after_build do |builder|
        exec('node bin/r.js -o build/javascripts/app.build.json;sed -i.bak "s|javascripts/app|javascripts/app.build|g" build/index.html')
      end
    end
    alias :included :registered
  end
end

::Middleman::Extensions.register(:requirejs, RequireJS)
