require_relative 'api'
# use Rack::Static, :urls => {"/" => 'build/index.html'}
API.compile!
run API