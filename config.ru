require './config/environment'

if ActiveRecord::Migrator.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end

#here is where I will mount other controllers with the keyword 'use'

#need rack::methodoverride to send patch and delete requests
use Rack::MethodOverride
run ApplicationController
