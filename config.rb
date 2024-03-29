require './bin/json_gerenator.rb'

###
# Reverse Proxy
###

# require 'rack/reverse_proxy'

# use Rack::ReverseProxy do 
#   # Set :preserve_host to true globally (default is true already)
#   reverse_proxy_options :preserve_host => true

#   # Forward the path /test* to http://example.com/test*
#   reverse_proxy '/api', 'http://localhost:3000/test'

#   # # Forward the path /foo/* to http://example.com/bar/*
#   # reverse_proxy /^\/foo(\/.*)$/, 'http://example.com/bar$1', :username => 'name', :password => 'basic_auth_secret'
# end

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

# Proxy pages (http://middlemanapp.com/basics/dynamic-pages/)
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
helpers do
  def g(*format)
    format.format_by_type
  end

  def t(key)
    Translation.fetch key.to_sym
  end
end

# set :debug_assets, true

set :css_dir, 'stylesheets'

set :js_dir, 'javascripts'

set :images_dir, 'images'

# Enable cache buster
# activate :asset_hash

# Build-specific configuration
configure :build do
  # For example, change the Compass output style for deployment
  # activate :minify_css

  # Minify Javascript on build
  # activate :minify_javascript

  # Use relative URLs
  activate :relative_assets

  # Or use a different image path
  # set :http_prefix, "/Content/images/"
end

