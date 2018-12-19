require './config/environment'

if ActiveRecord::Migrator.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end

error { |err|
  Rack::Response.new(
    [{'error' => err.message}.to_json],
    500,
    {'Content-type' => 'application/json'}
  ).finish
}
end

use Rack::MethodOverride
run ApplicationController
use TweetsController
use UsersController
