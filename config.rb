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

# Proxy pages (https://middlemanapp.com/advanced/dynamic_pages/)
# proxy "/this-page-has-no-template.html", "/template-file.html", :locals => {
#  :which_fake_page => "Rendering a fake page with a local variable" }

###
# Helpers
###

# Automatic image dimensions on image_tag helper
# activate :automatic_image_sizes

# Reload the browser automatically whenever files change
# configure :development do
#   activate :livereload
# end

# Methods defined in the helpers block are available in templates
# helpers do
#   def some_helper
#     "Helping"
#   end
# end

data.projects.each do |project|
  proxy "/projects/#{project[0].split('-')[1]}.html", "/projects/template.html", :locals => {project: project[1], short_name: project[0].split('-')[1]}, :ignore => true
end

configure :development do
  activate :livereload
end

set :css_dir, 'stylesheets'

set :js_dir, 'javascripts'

set :images_dir, 'images'

sprockets.append_path File.join root, 'bower_components'

activate :directory_indexes

# Build-specific configuration
configure :build do
  set :https, true

  set :relative_links, true

  activate :minify_css

  activate :minify_javascript

  activate :asset_hash do |opts|
    opts.ignore << 'favicon/*'
  end

  activate :relative_assets

  # activate :autoprefixer do |config|
  #   config.browsers = ['last 2 versions', 'Explorer >= 9']
  # end

  # activate :imageoptim
end
