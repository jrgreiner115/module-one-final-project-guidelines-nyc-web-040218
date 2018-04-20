require 'rest-client'
require 'json'
require 'pry'

def get_fighters_from_api
  #make the web request
    all_fighters = RestClient.get("http://ufc-data-api.ufc.com/api/v1/us/fighters")
    fighter_array = JSON.parse(all_fighters)
end

def seed_it(hash)
  get_fighters_from_api.each do
    Fighter.create(hash)
  end
end

seed_it
