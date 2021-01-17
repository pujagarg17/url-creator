class StatsJob < ApplicationJob
  queue_as :default

  def perform(url, ip_address)
    ip_address = "172.56.21.89" if ip_address == "::1"
    results = Geocoder.search(ip_address)
    country = results.first.country
    stat = Stat.find_or_initialize_by(url_id: url.id)
    stat.clicks = stat.clicks+=1
    stat.country << country unless stat.country.include?(country)
    stat.save
  end
end
